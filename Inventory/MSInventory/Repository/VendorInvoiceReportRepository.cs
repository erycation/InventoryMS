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

        public async Task<List<VendorInvoiceItemDto>> GetVendorInvoiceReportByVendorId(Guid vendorId, DateTime startDate, DateTime endDate)
        {
            return await _inventoryDBContext.VendorInvoiceItemDtos.FromSqlRaw("get_VendorInvoiceByVendorId @VendorId, @StartDate, @EndDate",
                                                                       new SqlParameter("@VendorId", vendorId),
                                                                        new SqlParameter("@StartDate", startDate),
                                                                         new SqlParameter("@EndDate", endDate)).ToListAsync();

        }
    }
}
