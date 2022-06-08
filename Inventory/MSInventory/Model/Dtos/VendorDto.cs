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
            InventoryInVendor = vendor.CountInventoryInVendor();
        }

        public Guid VendorId { get; set; }
        public string VendorName { get; set; }
        public string VendorCode { get; set; }
        public int InventoryInVendor { set; get; }
    }
}
