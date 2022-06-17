
using MSInventory.Model.Dtos;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace MSInventory.Repository.Interface
{
    public interface IVendorInvoiceReportRepository
    {
        Task<List<VendorInvoiceReportDto>> GetVendorInvoiceReportByInvoiceNumber(string invoiceNumber);
    }
}
