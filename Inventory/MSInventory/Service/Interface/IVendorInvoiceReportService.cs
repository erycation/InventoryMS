using MSInventory.Model.Dtos;
using MSInventory.Model.Request;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace MSInventory.Service.Interface
{
    public interface IVendorInvoiceReportService
    {
        Task<List<VendorInvoiceItemDto>> GetVendorInvoiceReportByVendorId(Guid vendorId, RequestVendorInvoice requestVendorInvoice);
        Task<byte[]> GenerateVendorInvoiceByInvoiceNumber(string invoiceNumber, string reportType);
    }
}
