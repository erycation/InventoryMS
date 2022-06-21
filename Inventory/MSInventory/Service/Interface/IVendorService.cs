
using MSInventory.Model.Dtos;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace MSInventory.Service.Interface
{
    public interface IVendorService
    {
        Task<VendorDto> AddVendor(VendorDto vendorDto);
        Task<VendorDto> UpdateVendor(VendorDto vendorDto);
        Task<VendorDto> GetVendorById(Guid vendorId);
        Task<VendorDto> GetVendorByName(string name);
        Task<List<VendorDto>> GetAllVendors();
        Task<List<VendorDto>> GetNonWarehouseVendors();
    }
}
