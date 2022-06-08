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
    public class ReportRepository : IReportRepository
    {

        private readonly InventoryDBContext _inventoryDBContext;

        public ReportRepository(InventoryDBContext inventoryDBContext)
        {
            _inventoryDBContext = inventoryDBContext;
        }

        public async Task<List<StockCountSheetReportDto>> GetStockCountSheetReport(Guid locationId)
        {
            return await _inventoryDBContext.StockCountSheetReportDtos.FromSqlRaw("sp_StockCountSheet @LocationVendorId, @OpeningBalanceDate",
                                                                       new SqlParameter("@LocationVendorId", locationId),
                                                                        new SqlParameter("@OpeningBalanceDate", DateTime.Now)).ToListAsync();
        }  

        public async Task<List<StockCountSheetReportDto>> GetExistingStockCountSheetReport(Guid certificateId, Guid locationId)
        {
            return await _inventoryDBContext.StockCountSheetReportDtos.FromSqlRaw("sp_ExistingStockCountSheet @InventoryCertificateId, @LocationVendorId",
                                                                       new SqlParameter("@InventoryCertificateId", certificateId),
                                                                        new SqlParameter("@LocationVendorId", locationId)).ToListAsync();
        }
    }
}
