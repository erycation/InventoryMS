using System;

namespace m2esolution.co.za.MSInventory.Model.Dtos
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
        }

        public Guid VendorId { get; set; }
        public string VendorName { get; set; }
        public string VendorCode { get; set; }
        
    }
}
