using System;

namespace MSInventory.Model.Dtos
{
    public class VendorInvoiceReportDto : VendorInvoiceDetailDto
    {
        public string ProductName { get; set; }
        public decimal Price { get; set; }
        public int Quantity { get; set; }
        public Decimal Amount { get; set; }
    }
}
