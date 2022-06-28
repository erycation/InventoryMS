

using Microsoft.EntityFrameworkCore;
using MSInventory.Model;
using MSInventory.Model.Dtos;
using MSInventory.Repository.Interface;
using MSInventory.Service.Interface;
using MSInventory.Shared.Helpers;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Linq;
using MSInventory.Shared.Utils;
using MSInventory.Model.Request;

namespace MSInventory.Service
{
    public class InventoryCertificateService : IInventoryCertificateService
    {

        private readonly IInventoryCertificateRepository _inventoryCertificateRepository;

        public InventoryCertificateService(IInventoryCertificateRepository inventoryCertificateRepository)
        {
            _inventoryCertificateRepository = inventoryCertificateRepository;
        }

        public async Task<InventoryCertificateDto> AddInventoryCertificate(InventoryCertificateDto inventoryCertificateDto)
        {
            var requestCertificate = new InventoryCertificate
            {
                OpeningDate = DateTime.Now.StartOfDay(),
                ClosingDate = null,
                VendorId = inventoryCertificateDto.VendorId,
                GeneratedById = null
            };

            var responseCertificate = await _inventoryCertificateRepository.AddAsync(requestCertificate);
            return responseCertificate != null ? new InventoryCertificateDto(responseCertificate) : throw new AppException($"Failed To Create Opening Certificate");
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

        public async Task<InventoryCertificateDto> GetOpeningBalanceCertificateByVendorId(Guid vendorId)
        {
            var openingCertificate = await _inventoryCertificateRepository.GetAll().Where(b => b.VendorId == vendorId && b.ClosingDate == null && b.GeneratedById == null).FirstOrDefaultAsync();
            return new InventoryCertificateDto(openingCertificate);
        }

        public async Task<List<InventoryCertificateDto>> GetHistoryInventoryCertificateByVendorId(RequestHistoryInventoryCertificate requestHistoryInventoryCertificate)
        {
            var inventoryCertificatesDto = new List<InventoryCertificateDto>();
            var inventoryCertificatesHistory = await _inventoryCertificateRepository.GetAll().Where(b => b.VendorId == requestHistoryInventoryCertificate.VendorId && b.OpeningDate >= requestHistoryInventoryCertificate.StartDate.StartOfDay() && b.ClosingDate <= requestHistoryInventoryCertificate.EndDate.EndOfDay()).OrderByDescending(c => c.OpeningDate).ToListAsync();
            foreach (var inventoryCertificate in inventoryCertificatesHistory)
            {
                inventoryCertificatesDto.Add(new InventoryCertificateDto(inventoryCertificate));
            }
            return inventoryCertificatesDto;
        }
    }
}
