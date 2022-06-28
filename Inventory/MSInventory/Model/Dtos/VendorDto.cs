using System;

namespace MSInventory.Model.Dtos
{
    public class VendorDto
    {

        public VendorDto()
        {

        }
        public VendorDto(Vendor vendor)
        {
            VendorId = vendor.Id;
            VendorName = vendor.Name;
            VendorCode = vendor.Code;
            ContactNumber = vendor.ContactNumber;
            Type = vendor.Type;
            InventoryInVendor = vendor.CountInventoryInVendor();
        }

        public Guid VendorId { get; set; }
        public string VendorName { get; set; }
        public string VendorCode { get; set; }
        public string ContactNumber { get; set; }
        public string Type { get; set; }
        public int InventoryInVendor { set; get; }
    }
}
