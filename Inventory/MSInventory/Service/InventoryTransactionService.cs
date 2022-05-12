

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

        public InventoryTransactionService(IInventoryTransactionRepository inventoryTransactionRepository)
        {
            _inventoryTransactionRepository = inventoryTransactionRepository;
        }

        //    public async Task<InventoryTransactionDto> CreditVendorLocation(ExpectedInventoryDto expectedInventoryDto, Guid locationId, string reference)
        //    {

        //        var requestInventoryTransaction = new InventoryTransaction
        //        {
        //            expectedInventoryDto.VendorId;//destination
        //        };

        //        var requestExpectedInventory = new ExpectedInventory
        //        {
        //            ReferenceNo = expectedInventoryDto.ReferenceNo,
        //            Supervisor = expectedInventoryDto.Supervisor,
        //            AdminId = expectedInventoryDto.AdminId,
        //            VendorId = expectedInventoryDto.VendorId,
        //            InventoryId = expectedInventoryDto.InventoryId,
        //            Quantity = expectedInventoryDto.Quantity,                
        //            Counted = false,
        //            CountedDate = null,
        //            SendToVendor = false,
        //            VarianceReason = "None",
        //        };

        //        var responseExpectedInventory = await _inventoryTransactionRepository.AddAsync(requestExpectedInventory);
        //        return responseExpectedInventory != null ? new ExpectedInventoryDto(responseExpectedInventory) : throw new AppException($"Failed To Allocate Inventory");

        //    }

        //    public async Task<ExpectedInventoryDto> GetExpectedInventoryById(Guid expectedInventoryId)
        //    {
        //        var expectedInventory = await _expectedInventoryRepository.GetAll().FirstOrDefaultAsync(x => x.Id == expectedInventoryId);
        //        return expectedInventory != null ? new ExpectedInventoryDto(expectedInventory) : throw new AppException($"Expected Inventory Not Found");
        //    }

        //    public async Task<List<ExpectedInventoryDto>> GetExpectedInventoriesAllocatedToAdmin(Guid adminId)
        //    {
        //        var expectedInventoriesDto = new List<ExpectedInventoryDto>();
        //        var expectedInventories = await _expectedInventoryRepository.GetAll().Where(x => x.AdminId == adminId && !x.SendToVendor).ToListAsync();// x => x.Id == expectedInventoryId);
        //        foreach (var expectedInventory in expectedInventories)
        //        {
        //            expectedInventoriesDto.Add(new ExpectedInventoryDto(expectedInventory));
        //        }
        //        return expectedInventoriesDto;
        //    }

        //    public async Task<List<ExpectedInventoryDto>> GetCountedExpectedInventoryByVendor(Guid adminId, Guid vendorId)
        //    {
        //        var expectedInventoriesDto = new List<ExpectedInventoryDto>();
        //        var expectedInventories = await _expectedInventoryRepository.GetAll().Where(x => x.AdminId == adminId && !x.SendToVendor && x.VendorId == vendorId).ToListAsync();// x => x.Id == expectedInventoryId);
        //        foreach (var expectedInventory in expectedInventories)
        //        {
        //            expectedInventoriesDto.Add(new ExpectedInventoryDto(expectedInventory));
        //        }
        //        return expectedInventoriesDto;
        //    }

        //    public async Task<List<ExpectedInventoryDto>> GetExpectedInventoriesAllocatedToAdminBySupervisor(string supervisorName)
        //    {
        //        var expectedInventoriesDto = new List<ExpectedInventoryDto>();
        //        var expectedInventories = await _expectedInventoryRepository.GetAll().Where(x => x.Supervisor == supervisorName && !x.SendToVendor).ToListAsync();// x => x.Id == expectedInventoryId);
        //        foreach (var expectedInventory in expectedInventories)
        //        {
        //            expectedInventoriesDto.Add(new ExpectedInventoryDto(expectedInventory));
        //        }
        //        return expectedInventoriesDto;
        //    }

        //    public async Task<ExpectedInventoryDto> CountExpectedInventory(ExpectedInventoryDto expectedInventoryDto)
        //    {
        //        var expectedInventory = await _expectedInventoryRepository.GetAll().AsNoTracking().FirstOrDefaultAsync(x => x.Id == expectedInventoryDto.ExpectedInventoryId);
        //        if (expectedInventory == null)
        //            throw new AppException($"Expected Inventory Not Found");

        //        expectedInventory.Count1 = expectedInventoryDto.Count1;
        //        expectedInventory.VarianceReason = expectedInventoryDto.VarianceReason;
        //        expectedInventory.Counted = true;
        //        expectedInventory.CountedDate = DateTime.Now;
        //        var responseExpectedInventory = await _expectedInventoryRepository.UpdateAsync(expectedInventory);
        //        return responseExpectedInventory != null ? new ExpectedInventoryDto(responseExpectedInventory) : throw new AppException($"Failed To Count Expected Inventory");
        //    }




        //    public async Task<ExpectedInventoryDto> SendExpectedInventoryToVendor(List<ExpectedInventoryDto> expectedInventoriesDto)
        //    {
        //        var successExpected = new ExpectedInventoryDto();
        //        foreach (var expectedInventoryDto in expectedInventoriesDto)
        //        {
        //            var expectedInventory = await _expectedInventoryRepository.GetAll().AsNoTracking().FirstOrDefaultAsync(x => x.Id == expectedInventoryDto.ExpectedInventoryId);
        //            if (expectedInventory == null)
        //                throw new AppException($"Expected Inventory Not Found");
        //            expectedInventory.SendToVendor = true;
        //            var responseExpectedInventory = await _expectedInventoryRepository.UpdateAsync(expectedInventory);

        //            if (responseExpectedInventory != null)
        //            {
        //                successExpected = new ExpectedInventoryDto(responseExpectedInventory);
        //            }
        //            else
        //            {
        //                throw new AppException($"Failed To Count Expected Inventory");
        //            }
        //        }
        //        return successExpected;
        //    }
        //}

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
                TrackingNumber = trackingNumber
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
                TrackingNumber = trackingNumber
            };

            return await SaveInventoryTransaction(requestInventoryTransactionDto);
        }
        
        public async Task<List<InventoryTransactionDto>> GetInventoryTransactionAwaitingToAcceptByVendor(Guid vendorId)
        {
            var inventoryTransactionsDto = new List<InventoryTransactionDto>();
            var inventoryTransactions = await _inventoryTransactionRepository.GetAll().Where(x => x.DestinationVendorId == vendorId && 
                                                                                             !x.Accepted && x.EntryType.ToLower() == EntryTypeEnum.Credit.ToString().ToLower()
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
                TrackingNumber = inventoryTransactionDto.TrackingNumber
            };

            var responseInventoryTransaction = await _inventoryTransactionRepository.AddAsync(requestInventoryTransaction);
            return responseInventoryTransaction != null ? new InventoryTransactionDto(responseInventoryTransaction) : throw new AppException($"Failed Creating Transaction");

        }

        #endregion
    }
}
