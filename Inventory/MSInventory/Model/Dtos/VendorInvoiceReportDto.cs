using System;

namespace MSInventory.Model.Dtos
{
    public class VendorInvoiceReportDto
    {
        public string InvoiceNumber { get; set; }
        public string TransactionDate { get; set; }    
        public string VendorName { get; set; }
        public string ProductName { get; set; }
        public decimal Price { get; set; }
        public int Quantity { get; set; }
        public Decimal Amount { get; set; }
        public string ProcessedBy { get; set; }

    }
}
