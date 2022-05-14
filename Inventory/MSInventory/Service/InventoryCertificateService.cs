

using Microsoft.EntityFrameworkCore;
using m2esolution.co.za.MSInventory.Model;
using m2esolution.co.za.MSInventory.Model.Dtos;
using m2esolution.co.za.MSInventory.Repository.Interface;
using m2esolution.co.za.MSInventory.Service.Interface;
using m2esolution.co.za.MSInventory.Shared.Helpers;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Linq;

namespace m2esolution.co.za.MSInventory.Service
{
    public class InventoryCertificateService : IInventoryCertificateService
    {

        private readonly IInventoryCertificateRepository _inventoryCertificateRepository;

        public InventoryCertificateService(IInventoryCertificateRepository inventoryCertificateRepository)
        {
            _inventoryCertificateRepository = inventoryCertificateRepository;
        }

        public async Task<List<InventoryCertificateDto>> GetAllInventoryCertificateByVendorId(Guid vendorId)
        {
            var inventoryCertificatesDto = new List<InventoryCertificateDto>();
            var inventoryCertificates = await _inventoryCertificateRepository.GetAll().Where(b => b.VendorId == vendorId).ToListAsync();
            foreach (var inventoryCertificate in inventoryCertificates)
            {
                inventoryCertificatesDto.Add(new InventoryCertificateDto(inventoryCertificate));
            }
            return inventoryCertificatesDto;
        }
    }
}
