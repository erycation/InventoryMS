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
    public class VendorInvoiceReportRepository : IVendorInvoiceReportRepository
    {

        private readonly InventoryDBContext _inventoryDBContext;

        public VendorInvoiceReportRepository(InventoryDBContext inventoryDBContext)
        {
            _inventoryDBContext = inventoryDBContext;
        }

        public async Task<List<VendorInvoiceReportDto>> GetVendorInvoiceReportByInvoiceNumber(string invoiceNumber)
        {
            return await _inventoryDBContext.VendorInvoiceReportDtos.FromSqlRaw("get_VendorInvoice @InvoiceNumber",
                                                                       new SqlParameter("@InvoiceNumber", invoiceNumber)).ToListAsync();
        }  

        //public async Task<List<StockCountSheetReportDto>> GetExistingStockCountSheetReport(Guid certificateId, Guid locationId)
        //{
        //    return await _inventoryDBContext.StockCountSheetReportDtos.FromSqlRaw("sp_ExistingStockCountSheet @InventoryCertificateId, @LocationVendorId",
        //                                                               new SqlParameter("@InventoryCertificateId", certificateId),
        //                                                                new SqlParameter("@LocationVendorId", locationId)).ToListAsync();
        //}
    }
}
