

using Microsoft.EntityFrameworkCore;
using m2esolution.co.za.MSInventory.Model;
using m2esolution.co.za.MSInventory.Model.Dtos;
using m2esolution.co.za.MSInventory.Repository.Interface;
using m2esolution.co.za.MSInventory.Service.Interface;
using m2esolution.co.za.MSInventory.Shared.Helpers;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace m2esolution.co.za.MSInventory.Service
{
    public class VendorService : IVendorService
    {

        private readonly IVendorRepository _vendorRepository;

        public VendorService(IVendorRepository vendorRepository)
        {
            _vendorRepository = vendorRepository;
        }

        public async Task<VendorDto> AddVendor(VendorDto vendorDto)
        {

            var branchResults = await _vendorRepository.GetAll().AsNoTracking().FirstOrDefaultAsync(b => b.Name.Replace(" ", String.Empty) == vendorDto.VendorName.Replace(" ", String.Empty));
            if (branchResults != null)
                throw new AppException($"Vendor {vendorDto.VendorName} Already Exist");

            var requestBranch = new Vendor
            {
                Name = vendorDto.VendorName
            };

            var responseBranch = await _vendorRepository.AddAsync(requestBranch);
            return responseBranch != null ? new VendorDto(responseBranch) : throw new AppException($"Failed To Create Branch");
        }

        public async Task<VendorDto> UpdateVendor(VendorDto vendorDto)
        {
            var branchResults = await _vendorRepository.GetAll().AsNoTracking().FirstOrDefaultAsync(b => b.Name.Replace(" ", String.Empty) == vendorDto.VendorName.Replace(" ", String.Empty) && b.Id != vendorDto.VendorId);
            if (branchResults != null)
                throw new AppException($"Vendor {vendorDto.VendorName} Already Exist");

            var branch = await _vendorRepository.GetAll().AsNoTracking().FirstOrDefaultAsync(b => b.Id == vendorDto.VendorId);
            if (branch == null)
                throw new AppException($"Vendor {vendorDto.VendorName} Not Exist");

            var requestVendor = new Vendor
            {
                Id = vendorDto.VendorId,
                Name = vendorDto.VendorName
            };

            var responseBranch = await _vendorRepository.UpdateAsync(requestVendor);
            return responseBranch != null ? new VendorDto(responseBranch) : throw new AppException($"Failed To Update Vendor");
        }
        public async Task<VendorDto> GetVendorById(Guid vendorId)
        {
            var vendor = await _vendorRepository.GetAll().FirstOrDefaultAsync(x => x.Id == vendorId);
            return new VendorDto(vendor);
        }

        public async Task<VendorDto> GetVendorByName(string name)
        {
            var vendor = await _vendorRepository.GetAll().FirstOrDefaultAsync(x => x.Name == name);
            return new VendorDto(vendor);
        }
        public async Task<List<VendorDto>> GetAllVendors()
        {
            var vendorsDto = new List<VendorDto>();
            var vendors = await _vendorRepository.GetAll().ToListAsync();
            foreach (var vendor in vendors)
            {
                vendorsDto.Add(new VendorDto(vendor));
            }
            return vendorsDto;
        }
    }
}
