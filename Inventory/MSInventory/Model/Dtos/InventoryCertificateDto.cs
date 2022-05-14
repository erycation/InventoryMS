using System;

namespace m2esolution.co.za.MSInventory.Model.Dtos
{
    public class InventoryCertificateDto
    {
        public InventoryCertificateDto()
        {

        }
        public InventoryCertificateDto(InventoryCertificate inventoryCertificate)
        {
            InventoryCertificateId = inventoryCertificate.Id;
            OpeningDate = inventoryCertificate.OpeningDate;
            ClosingDate = inventoryCertificate.ClosingDate;
            VendorId = inventoryCertificate.VendorId;
            GeneratedById = inventoryCertificate.GeneratedById;
            GeneratedUserName = inventoryCertificate?.GeneratedUser?.Username;
            VendorName = inventoryCertificate?.Vendor?.Name;
            TotalQuantity = inventoryCertificate.TotalQuantity;
        }

        public Guid InventoryCertificateId { get; set; }
        public DateTime OpeningDate { get; set; }
        public DateTime? ClosingDate { get; set; }
        public Guid VendorId { get; set; }
        public Guid? GeneratedById { get; set; }
        public string GeneratedUserName { get; set; }
        public string VendorName { get; set; }
        public int TotalQuantity { get; set; }

        
    }
}
