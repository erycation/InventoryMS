
using MSInventory.Model.Dtos;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace MSInventory.Repository.Interface
{
    public interface IVendorInvoiceReportRepository
    {
        Task<List<VendorInvoiceReportDto>> GetVendorInvoiceReportByInvoiceNumber(string invoiceNumber);
        Task<List<VendorInvoiceItemDto>> GetVendorInvoiceReportByVendorId(Guid vendorId, DateTime startDate, DateTime endDate);
    }
}
