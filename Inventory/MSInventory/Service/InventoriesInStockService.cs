

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
    public class InventoriesInStockService : IInventoriesInStockService
    {

        private readonly IInventoryInStockRepository _inventoryInStockRepository;

        public InventoriesInStockService(IInventoryInStockRepository inventoryInStockRepository)
        {
            _inventoryInStockRepository = inventoryInStockRepository;
        }

        public async Task<List<InventoryInStockDto>> GetInventoriesInStockByVendorId(Guid vendorId)
        {
            return await _inventoryInStockRepository.GetInventoriesInStockByVendorId(vendorId);
        }
    }
}
       