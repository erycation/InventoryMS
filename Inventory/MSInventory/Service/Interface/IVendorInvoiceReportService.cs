using System.Threading.Tasks;

namespace MSInventory.Service.Interface
{
    public interface IVendorInvoiceReportService
    {
        Task<byte[]> GenerateVendorInvoiceByInvoiceNumber(string invoiceNumber, string reportType);
    }
}
