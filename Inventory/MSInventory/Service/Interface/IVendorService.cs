
using m2esolution.co.za.MSInventory.Model.Dtos;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace m2esolution.co.za.MSInventory.Service.Interface
{
    public interface IVendorService
    {
        Task<VendorDto> AddVendor(VendorDto vendorDto);
        Task<VendorDto> UpdateVendor(VendorDto vendorDto);
        Task<VendorDto> GetVendorById(Guid vendorId);
        Task<List<VendorDto>> GetAllVendors();
    }
}
