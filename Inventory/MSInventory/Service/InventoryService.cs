

using Microsoft.EntityFrameworkCore;
using MSInventory.Model;
using MSInventory.Model.Dtos;
using MSInventory.Repository.Interface;
using MSInventory.Service.Interface;
using MSInventory.Shared.Helpers;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace MSInventory.Service
{
    public class InventoryService : IInventoryService
    {

        private readonly IInventoryRepository _inventoryRepository;

        public InventoryService(IInventoryRepository inventoryRepository)
        {
            _inventoryRepository = inventoryRepository;
        }

        public async Task<InventoryDto> AddInventory(InventoryDto inventoryDto)
        {
            var inventoryResults = await _inventoryRepository.GetAll().AsNoTracking().FirstOrDefaultAsync(b => b.ProductName.Replace(" ", String.Empty) == inventoryDto.ProductName.Replace(" ", String.Empty));
            if (inventoryResults != null)
                throw new AppException($"Inventory Name {inventoryResults.ProductName} Already Exist");

            var requestInventory = new Inventory
            {
                ProductName = inventoryDto.ProductName,
                Image = $"IMG-20220524-WA0016.jpg",
                Price = inventoryDto.Price
            };

            var responseInventory = await _inventoryRepository.AddAsync(requestInventory);
            return responseInventory != null ? new InventoryDto(responseInventory) : throw new AppException($"Failed To Create Inventory");
        }

        public async Task<List<InventoryDto>> GetAllInventories()
        {
            var InventoriesDto = new List<InventoryDto>();
            var inventories = await _inventoryRepository.GetAll().ToListAsync();
            foreach (var inventory in inventories)
            {
                InventoriesDto.Add(new InventoryDto(inventory));
            }
            return InventoriesDto;
        }

        public async Task<InventoryDto> GetInventoryById(Guid inventoryId)
        {
            var inventory = await _inventoryRepository.GetAll().FirstOrDefaultAsync(x => x.Id == inventoryId);
            return new InventoryDto(inventory);
        }
        
        public async Task<InventoryDto> UpdateInventory(InventoryDto inventoryDto)
        {
            var inventoryResults = await _inventoryRepository.GetAll().AsNoTracking().FirstOrDefaultAsync(b => b.ProductName.Replace(" ", String.Empty) == inventoryDto.ProductName.Replace(" ", String.Empty) && b.Id != inventoryDto.InventoryId);
            if (inventoryResults != null)
                throw new AppException($"Inventory {inventoryDto.ProductName} Already Exist");     

            var requestInventory = new Inventory
            {
                Id = inventoryDto.InventoryId,
                ProductName = inventoryDto.ProductName,
                Price = inventoryDto.Price
            };

            var responseInventory = await _inventoryRepository.UpdateAsync(requestInventory);
            return responseInventory != null ? new InventoryDto(responseInventory) : throw new AppException($"Failed To Update Inventory");
        }
    }
}
