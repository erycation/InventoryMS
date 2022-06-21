

using Microsoft.EntityFrameworkCore;
using MSInventory.Model;
using MSInventory.Model.Dtos;
using MSInventory.Repository.Interface;
using MSInventory.Service.Interface;
using MSInventory.Shared.Helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MSInventory.Service
{
    public class VendorService : IVendorService
    {

        private readonly IVendorRepository _vendorRepository;
        private IInventoryCertificateService _inventoryCertificateService;
        public VendorService(IVendorRepository vendorRepository,
                             IInventoryCertificateService inventoryCertificateService)
        {
            _vendorRepository = vendorRepository;
            _inventoryCertificateService = inventoryCertificateService;
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
            if (responseBranch != null)
            {
                var requestCertificate = new InventoryCertificateDto
                {
                    VendorId = responseBranch.Id
                };
                await _inventoryCertificateService.AddInventoryCertificate(requestCertificate);
            }

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

        public async Task<List<VendorDto>> GetNonWarehouseVendors()
        {
            var vendorsDto = new List<VendorDto>();
            var vendors = await _vendorRepository.GetAll().Where(v => v.Name.ToLower() != "warehouse").ToListAsync();
            foreach (var vendor in vendors)
            {
                vendorsDto.Add(new VendorDto(vendor));
            }
            return vendorsDto;
        }
    }
}
