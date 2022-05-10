
using m2esolution.co.za.MSInventory.Model.Dtos;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace m2esolution.co.za.MSInventory.Service.Interface
{
    public interface IExpectedInventoryService
    {
        Task<ExpectedInventoryDto> AddExpectedInventory(ExpectedInventoryDto expectedInventory);
        Task<ExpectedInventoryDto> UpdateExpectedInventory(VendorDto expectedInventory);
        Task<ExpectedInventoryDto> GetExpectedInventoryById(Guid expectedInventoryId);
        Task<List<ExpectedInventoryDto>> GetNotCountedExpectedInventoriesByAdminId(Guid adminId);
        Task<List<ExpectedInventoryDto>> GetNotExpectedInventoriesBySupervisor(string supervisorName);
    }
}
