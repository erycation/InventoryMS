

using Microsoft.EntityFrameworkCore;
using MSInventory.Model;
using MSInventory.Model.Dtos;
using MSInventory.Repository.Interface;
using MSInventory.Service.Interface;
using MSInventory.Shared.Helpers;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Linq;
using MSInventory.Shared.Enum;

namespace MSInventory.Service
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

        public async Task<InventoryTransactionDto> CaptureTransactionToCreditProduction(InventoryTransactionDto inventoryTransactionDto)
        {
            var trackingNumber = $"PROD{DateTime.Now:yyyyMMddHHmmss}_{Guid.NewGuid().ToString().Substring(1, 5)}";

            var requestInventoryTransactionDto = new InventoryTransactionDto
            {
                EntryType = EntryTypeEnum.Credit.ToString(),
                TransactionType = TransactionTypeEnum.Inventory.ToString(),
                TrackingStatus = TrackingStatusEnum.Production.ToString(),
                InventoryId = inventoryTransactionDto.InventoryId,
                Quantity = inventoryTransactionDto.Quantity,
                Accepted = false,
                VerifiedStatus = VerifiedStatusEnum.Unverified.ToString(),
                ProcessById = inventoryTransactionDto.ProcessById,
                LocationVendorId = inventoryTransactionDto.LocationVendorId,
                DestinationVendorId = inventoryTransactionDto.LocationVendorId,
                OrderItemId = null,
                Deleted = false,
                DeletedById = null,
                TrackingNumber = trackingNumber,
                AcceptedByUserId = null
            };

            return await SaveInventoryTransaction(requestInventoryTransactionDto);
        }

        public async Task<List<InventoryTransactionDto>> GetInventoryTransactionCapturedInProduction(Guid vendorId)
        {
            var inventoryTransactionsDto = new List<InventoryTransactionDto>();
            var inventoryTransactions = await _inventoryTransactionRepository.GetAll().Where(x => x.LocationVendorId == vendorId &&
                                                                                             x.DestinationVendorId == vendorId &&
                                                                                              x.TrackingStatus.ToLower() == TrackingStatusEnum.Production.ToString().ToLower() &&
                                                                                             !x.Accepted && 
                                                                                             x.EntryType.ToLower() == EntryTypeEnum.Credit.ToString().ToLower()
                                                                                             && x.VerifiedStatus.ToLower() == VerifiedStatusEnum.Unverified.ToString().ToLower()).ToListAsync();
            foreach (var inventoryTransaction in inventoryTransactions)
            {
                inventoryTransactionsDto.Add(new InventoryTransactionDto(inventoryTransaction));
            }
            return inventoryTransactionsDto;
        }

        public async Task<InventoryTransactionDto> VerifyTransactionSendToProduction(List<InventoryTransactionDto> inventoryTransactionDtos)
        {
            VendorDto vendorResponse = await _vendorService.GetVendorByName("Warehouse");
            if (vendorResponse == null)
                throw new AppException($"Customer Location Not Configured");

            foreach (var inventoryTransactionDto in inventoryTransactionDtos)
            {
                var inventoryTransaction = await _inventoryTransactionRepository.GetAll().FirstOrDefaultAsync(x => x.Id == inventoryTransactionDto.InventoryTransactionId);
                if (inventoryTransaction == null)
                    throw new AppException($"Inventory Transaction Not Found");
                inventoryTransaction.Accepted = true;
                inventoryTransaction.AcceptedByUserId = inventoryTransactionDto.ProcessById;
                var responseInventoryTransaction = await _inventoryTransactionRepository.UpdateAsync(inventoryTransaction);
                if (responseInventoryTransaction == null)
                    throw new AppException($"Failed To Accept Inventory");
                var creditTransactionProduction = new InventoryTransactionDto(responseInventoryTransaction)
                {
                    LocationVendorId = responseInventoryTransaction.LocationVendorId,
                    EntryType = EntryTypeEnum.Credit.ToString(),
                    TrackingStatus = TrackingStatusEnum.Production.ToString(),
                    DestinationVendorId = responseInventoryTransaction.LocationVendorId,
                    VerifiedStatus = VerifiedStatusEnum.Verified.ToString()

                };
                var responseCreditProductionLocation = await SaveInventoryTransaction(creditTransactionProduction);
                if (responseCreditProductionLocation == null)
                    throw new AppException($"Failed To Credit Production");

                responseCreditProductionLocation.Quantity *= -1;
                responseCreditProductionLocation.EntryType = EntryTypeEnum.Debit.ToString();

                var responseDebitproductionLocation = await SaveInventoryTransaction(responseCreditProductionLocation);
                if (responseCreditProductionLocation == null)
                    throw new AppException($"Failed To Debit Production");

                responseDebitproductionLocation.Quantity = creditTransactionProduction.Quantity;
                responseDebitproductionLocation.EntryType = EntryTypeEnum.Credit.ToString();
                responseDebitproductionLocation.DestinationVendorId = vendorResponse.VendorId;
                responseDebitproductionLocation.Accepted = false;
                responseDebitproductionLocation.AcceptedByUserId = null;
                responseDebitproductionLocation.TrackingStatus = TrackingStatusEnum.Intransit.ToString();

              var responseCreditWarehouseLocation = await SaveInventoryTransaction(responseDebitproductionLocation);
                if (responseCreditProductionLocation == null)
                    throw new AppException($"Failed To Credit Warehouse");
            }

            return new InventoryTransactionDto();
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

                //
                var debitAcceptedLocationTransactionVendorArea = new InventoryTransactionDto(responseInventoryTransaction)
                {
                    EntryType = EntryTypeEnum.Debit.ToString(),
                    Quantity = inventoryTransactionDto.Quantity * -1
                };
                var responseDebitVendorLocation = await SaveInventoryTransaction(debitAcceptedLocationTransactionVendorArea);
                if (responseDebitVendorLocation == null)
                    throw new AppException($"Failed To Confirm Inventory");

                //
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
