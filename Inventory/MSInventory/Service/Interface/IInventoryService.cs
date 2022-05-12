
using m2esolution.co.za.MSInventory.Model.Dtos;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace m2esolution.co.za.MSInventory.Service.Interface
{
    public interface IInventoryService
    {
        Task<InventoryDto> AddInventory(InventoryDto inventoryDto);
        Task<InventoryDto> UpdateInventory(InventoryDto inventoryDto);
        Task<InventoryDto> GetInventoryById(Guid inventoryId);
        Task<List<InventoryDto>> GetAllInventories();
    }
}
