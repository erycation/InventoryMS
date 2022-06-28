using MSInventory.Model.Dtos;
using MSInventory.Repository.Interface;
using MSInventory.Shared;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace MSInventory.Repository
{
    public class InventoryInStockRepository : IInventoryInStockRepository
    {

        private readonly InventoryDBContext _inventoryDBContext;

        public InventoryInStockRepository(InventoryDBContext inventoryDBContext)
        {
            _inventoryDBContext = inventoryDBContext;
        }

        public async Task<List<InventoryInStockDto>> GetInventoriesInStockByVendorId(Guid vendorId)
        {
            return await _inventoryDBContext.InventoryInStockDtos.FromSqlRaw("sp_getInventoryInStockByVendor @vendorId",
                                                                       new SqlParameter("@vendorId", vendorId)).ToListAsync();
        }  
    }
}
