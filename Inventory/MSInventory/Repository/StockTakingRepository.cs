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
    public class StockTakingRepository : IStockTakingRepository
    {

        private readonly InventoryDBContext _inventoryDBContext;

        public StockTakingRepository(InventoryDBContext inventoryDBContext)
        {
            _inventoryDBContext = inventoryDBContext;
        }

        public async Task<List<StockTakingDto>> GetCurrentStockTakingByVendorId(Guid locationId)
        {
            return await _inventoryDBContext.StockTakingDtos.FromSqlRaw("sp_CurrentStockTakingByVendorId @LocationVendorId",
                                                                       new SqlParameter("@LocationVendorId", locationId)).ToListAsync();
        }  
    }
}
