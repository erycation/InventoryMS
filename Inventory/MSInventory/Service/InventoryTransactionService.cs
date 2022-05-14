

using Microsoft.EntityFrameworkCore;
using m2esolution.co.za.MSInventory.Model;
using m2esolution.co.za.MSInventory.Model.Dtos;
using m2esolution.co.za.MSInventory.Repository.Interface;
using m2esolution.co.za.MSInventory.Service.Interface;
using m2esolution.co.za.MSInventory.Shared.Helpers;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Linq;
using m2esolution.co.za.MSInventory.Shared.Enum;

namespace m2esolution.co.za.MSInventory.Service
{
    public class InventoryTransactionService : IInventoryTransactionService
    {

        private readonly IInventoryTransactionRepository _inventoryTransactionRepository;
        private IOrderService _orderService;
        private IOrderItemService _orderItemService;
        private IVendorService _vendorService;

        public InventoryTransactionService(IInventoryTransactionRepository inventoryTransactionRepository,
                                            IOrderService orderService,
                                            IOrderItemService orderItemService,
                                            IVendorService vendorService)
        {
            _inventoryTransactionRepository = inventoryTransactionRepository;
            _orderService = orderService;
            _orderItemService = orderItemService;
            _vendorService = vendorService;
        }

        public async Task<InventoryTransactionDto> CreditFromExpectedInventoryTransaction(ExpectedInventoryDto expectedInventoryDto, Guid locationVendorId, string trackingNumber)
        {
            var requestInventoryTransactionDto = new InventoryTransactionDto
            {
                EntryType = EntryTypeEnum.Credit.ToString(),
                TransactionType = TransactionTypeEnum.Inventory.ToString(),
                TrackingStatus = TrackingStatusEnum.Intransit.ToString(),
                InventoryId = expectedInventoryDto.InventoryId,
                Quantity = expectedInventoryDto.Count1,
                Accepted = false,
                VerifiedStatus = VerifiedStatusEnum.Verified.ToString(),
                ProcessById = expectedInventoryDto.AdminId,
                LocationVendorId = locationVendorId,
                DestinationVendorId = expectedInventoryDto.VendorId,
                OrderItemId = null,
                Deleted = false,
                DeletedById = null,
                TrackingNumber = trackingNumber,
                AcceptedByUserId = null
            };

            return await SaveInventoryTransaction(requestInventoryTransactionDto);
        }
       
        public async Task<InventoryTransactionDto> DebitThroughExpectedInventoryTransaction(ExpectedInventoryDto expectedInventoryDto, Guid locationVendorId, string trackingNumber)
        {
            var requestInventoryTransactionDto = new InventoryTransactionDto
            {
                EntryType = EntryTypeEnum.Debit.ToString(),
                TransactionType = TransactionTypeEnum.Inventory.ToString(),
                TrackingStatus = TrackingStatusEnum.PreTransit.ToString(),
                InventoryId = expectedInventoryDto.InventoryId,
                Quantity = expectedInventoryDto.Count1 * -1,
                Accepted = false,
                VerifiedStatus = VerifiedStatusEnum.Verified.ToString(),
                ProcessById = expectedInventoryDto.AdminId,
                LocationVendorId = locationVendorId,
                DestinationVendorId = expectedInventoryDto.VendorId,
                OrderItemId = null,
                Deleted = false,
                DeletedById = null,
                TrackingNumber = trackingNumber,
                AcceptedByUserId = null
            };

            return await SaveInventoryTransaction(requestInventoryTransactionDto);
        }
        
        public async Task<List<InventoryTransactionDto>> GetInventoryTransactionAwaitingToAcceptByVendor(Guid vendorId)
        {
            var inventoryTransactionsDto = new List<InventoryTransactionDto>();
            var inventoryTransactions = await _inventoryTransactionRepository.GetAll().Where(x => x.DestinationVendorId == vendorId && 
                                                                                             !x.Accepted &&
                                                                                              x.AcceptedByUserId == null && 
                                                                                              x.EntryType.ToLower() == EntryTypeEnum.Credit.ToString().ToLower()
                                                                                             && x.VerifiedStatus.ToLower() == VerifiedStatusEnum.Verified.ToString().ToLower()).ToListAsync();
            foreach (var inventoryTransaction in inventoryTransactions)
            {
                inventoryTransactionsDto.Add(new InventoryTransactionDto(inventoryTransaction));
            }
            return inventoryTransactionsDto;
        }

        public async Task<List<InventoryTransactionDto>> GetOutgoingInventoryTransactionAwaitingToAcceptByVendor(Guid vendorId)
        {
            var inventoryTransactionsDto = new List<InventoryTransactionDto>();
            var inventoryTransactions = await _inventoryTransactionRepository.GetAll().Where(x => x.LocationVendorId == vendorId &&
                                                                                             x.DestinationVendorId != vendorId &&                                                                                            
                                                                                             !x.Accepted && x.EntryType.ToLower() == EntryTypeEnum.Credit.ToString().ToLower()
                                                                                             && x.VerifiedStatus.ToLower() == VerifiedStatusEnum.Verified.ToString().ToLower()).ToListAsync();
            foreach (var inventoryTransaction in inventoryTransactions)
            {
                inventoryTransactionsDto.Add(new InventoryTransactionDto(inventoryTransaction));
            }
            return inventoryTransactionsDto;
        }

        public async Task<InventoryTransactionDto> AcceptAwaitingTransactionInToVendor(List<InventoryTransactionDto> inventoryTransactionDtos,Guid vendorId, Guid userId)
        {

            foreach (var inventoryTransactionDto in inventoryTransactionDtos)
            {
                var inventoryTransaction = await _inventoryTransactionRepository.GetAll().FirstOrDefaultAsync(x => x.Id == inventoryTransactionDto.InventoryTransactionId);
                if (inventoryTransaction == null)
                    throw new AppException($"Inventory Transaction Not Found");
                inventoryTransaction.Accepted = true;
                inventoryTransaction.AcceptedByUserId = userId;
                var responseInventoryTransaction = await _inventoryTransactionRepository.UpdateAsync(inventoryTransaction);
                if (responseInventoryTransaction == null)
                    throw new AppException($"Failed To Accept Inventory");
                var creditTransactionVendorArea = new InventoryTransactionDto(responseInventoryTransaction)
                {
                    LocationVendorId = vendorId,
                    EntryType = EntryTypeEnum.Credit.ToString(),
                    TrackingStatus = TrackingStatusEnum.Delivered.ToString()
                };
                var responseCreditVendorLocation = await SaveInventoryTransaction(creditTransactionVendorArea);
                if (responseCreditVendorLocation == null)
                    throw new AppException($"Failed To Confirm Inventory");

            }

            return new InventoryTransactionDto();
        }

        public async Task<string> CreateCustomerOrder(List<CustomerOrderItemToBePlacedDto> customerOrderItemToBePlacedDtos)
        {

            var vendorResponse = await _vendorService.GetVendorByName("Customer");
            if (vendorResponse == null)
                throw new AppException($"Customer Location Not Configured");

            var trackingNumber = $"CUST{DateTime.Now:yyyyMMddHHmmss}_{Guid.NewGuid().ToString().Substring(1, 5)}";

            var requestOrder = new OrderDto
            {
                OrderNumber = $"AEON_{DateTime.Now:yyyyMMddHHmmss}_{Guid.NewGuid().ToString().Substring(1, 5)}",
                CustomerId = customerOrderItemToBePlacedDtos[0].CustomerId
            };

            var responseOrder = await _orderService.AddOrder(requestOrder);

            foreach (var customerOrderItemToBePlacedDto in customerOrderItemToBePlacedDtos)
            {
                var requestOrderItem = new OrderItemDto
                {
                    OrderId = responseOrder.OrderId
                };

                var responseOrderItem = await _orderItemService.AddOrder(requestOrderItem);

                var creditDebitVendor = new InventoryTransactionDto()
                {
                    EntryType = EntryTypeEnum.Debit.ToString(),
                    TransactionType = TransactionTypeEnum.Inventory.ToString(),
                    TrackingStatus = TrackingStatusEnum.Customer.ToString(),
                    InventoryId = customerOrderItemToBePlacedDto.InventoryId,
                    Quantity = customerOrderItemToBePlacedDto.Quantity * -1,
                    Accepted = true,
                    VerifiedStatus = VerifiedStatusEnum.Verified.ToString(),
                    ProcessById = customerOrderItemToBePlacedDto.ProcessById,
                    LocationVendorId = customerOrderItemToBePlacedDto.LocationVendorId,
                    DestinationVendorId = vendorResponse.VendorId,
                    OrderItemId = responseOrderItem.OrderItemId,
                    Deleted = false,
                    DeletedById = null,
                    TrackingNumber = trackingNumber,
                    AcceptedByUserId = customerOrderItemToBePlacedDto.ProcessById
                };

                var responseDebitVendorLocation = await SaveInventoryTransaction(creditDebitVendor);
                if (responseDebitVendorLocation == null)
                    throw new AppException($"Failed To Debit Vendor");

                //Credit customer
                responseDebitVendorLocation.EntryType = EntryTypeEnum.Credit.ToString();
                responseDebitVendorLocation.Quantity = customerOrderItemToBePlacedDto.Quantity;
                responseDebitVendorLocation.LocationVendorId = vendorResponse.VendorId;
                var responseCustomerVendorLocation = await SaveInventoryTransaction(responseDebitVendorLocation);
                if (responseDebitVendorLocation == null)
                    throw new AppException($"Failed To Credit Customer");
            }

            return responseOrder.OrderNumber;
        }

        #region PrivateMethods
        private async Task<InventoryTransactionDto> SaveInventoryTransaction(InventoryTransactionDto inventoryTransactionDto)
        {
            var requestInventoryTransaction = new InventoryTransaction
            {
                EntryType = inventoryTransactionDto.EntryType,
                TransactionType = inventoryTransactionDto.TransactionType,
                TrackingStatus = inventoryTransactionDto.TrackingStatus,
                InventoryId = inventoryTransactionDto.InventoryId,
                Quantity = inventoryTransactionDto.Quantity,
                Accepted = inventoryTransactionDto.Accepted,
                VerifiedStatus = inventoryTransactionDto.VerifiedStatus,
                ProcessById = inventoryTransactionDto.ProcessById,
                LocationVendorId = inventoryTransactionDto.LocationVendorId,
                DestinationVendorId = inventoryTransactionDto.DestinationVendorId,
                OrderItemId = inventoryTransactionDto.OrderItemId,
                Deleted = inventoryTransactionDto.Deleted,
                DeletedById = inventoryTransactionDto.DeletedById,
                TrackingNumber = inventoryTransactionDto.TrackingNumber,
                AcceptedByUserId = inventoryTransactionDto.AcceptedByUserId
            };

            var responseInventoryTransaction = await _inventoryTransactionRepository.AddAsync(requestInventoryTransaction);
            return responseInventoryTransaction != null ? new InventoryTransactionDto(responseInventoryTransaction) : throw new AppException($"Failed Creating Transaction");

        }

        #endregion
    }
}
