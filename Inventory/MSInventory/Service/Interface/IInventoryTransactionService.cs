
using m2esolution.co.za.MSInventory.Model.Dtos;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace m2esolution.co.za.MSInventory.Service.Interface
{
    public interface IInventoryTransactionService
    {

        Task<InventoryTransactionDto> CreditFromExpectedInventoryTransaction(ExpectedInventoryDto expectedInventoryDto, Guid locationVendorId, string trackingNumber);
        Task<InventoryTransactionDto> DebitThroughExpectedInventoryTransaction(ExpectedInventoryDto expectedInventoryDto, Guid locationVendorId, string trackingNumber);
        Task<List<InventoryTransactionDto>> GetInventoryTransactionAwaitingToAcceptByVendor(Guid vendorId);
        Task<List<InventoryTransactionDto>> GetOutgoingInventoryTransactionAwaitingToAcceptByVendor(Guid vendorId);
        //Task<ExpectedInventoryDto> CreateAndAllocateExpectedInventory(ExpectedInventoryDto expectedInventory);
        //Task<ExpectedInventoryDto> CountExpectedInventory(ExpectedInventoryDto expectedInventoryDto);
        //Task<ExpectedInventoryDto> SendExpectedInventoryToVendor(List<ExpectedInventoryDto> expectedInventoriesDto);
        //Task<ExpectedInventoryDto> GetExpectedInventoryById(Guid expectedInventoryId);
        //Task<List<ExpectedInventoryDto>> GetExpectedInventoriesAllocatedToAdmin(Guid adminId);
        //Task<List<ExpectedInventoryDto>> GetCountedExpectedInventoryByVendor(Guid adminId, Guid vendorId);
        //Task<List<ExpectedInventoryDto>> GetExpectedInventoriesAllocatedToAdminBySupervisor(string supervisorName);
    }
}
