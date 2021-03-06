
using MSInventory.Model.Dtos;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace MSInventory.Service.Interface
{
    public interface IExpectedInventoryService
    {
        Task<ExpectedInventoryDto> CreateAndAllocateExpectedInventory(ExpectedInventoryDto expectedInventory);
        Task<ExpectedInventoryDto> CountExpectedInventory(ExpectedInventoryDto expectedInventoryDto);
        Task<string> SendExpectedInventoryToVendor(List<ExpectedInventoryDto> expectedInventoriesDto, Guid locationId);
        Task<ExpectedInventoryDto> GetExpectedInventoryById(Guid expectedInventoryId);
        Task<List<ExpectedInventoryDto>> GetExpectedInventoriesAllocatedToAdmin(Guid adminId);
        Task<List<ExpectedInventoryDto>> GetCountedExpectedInventoryByVendor(Guid adminId, Guid vendorId);
        Task<List<ExpectedInventoryDto>> GetExpectedInventoriesAllocatedToAdminBySupervisor(string supervisorName);
    }
}
