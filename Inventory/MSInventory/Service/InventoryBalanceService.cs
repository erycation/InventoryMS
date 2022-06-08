

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

namespace MSInventory.Service
{
    public class InventoryBalanceService : IInventoryBalanceService
    {

        private readonly IInventoryBalanceRepository _inventoryBalanceRepository;
        private IInventoryCertificateService _inventoryCertificateService;

        public InventoryBalanceService(IInventoryBalanceRepository inventoryBalanceRepository,
                                        IInventoryCertificateService inventoryCertificateService)
        {
            _inventoryBalanceRepository = inventoryBalanceRepository;
            _inventoryCertificateService = inventoryCertificateService;
        }

        public async Task<InventoryBalanceDto> AddOpeningBalance(Guid vendorId, InventoryBalanceDto inventoryBalanceDto)
        {
            var balanceCertificate = await _inventoryCertificateService.GetOpeningBalanceCertificateByVendorId(vendorId);
            if(balanceCertificate == null)
                throw new AppException($"Certificate For Vendor Required");

            var existingOpeningBalance =  await _inventoryBalanceRepository.GetAll().Where(b => b.InventoryCertificateId == balanceCertificate.InventoryCertificateId && b.InventoryId == inventoryBalanceDto.InventoryId).FirstOrDefaultAsync();
            if (existingOpeningBalance != null)
                throw new AppException($"Inventory already have opening balance");

            var requestBalance = new InventoryBalance
            {
                InventoryCertificateId = balanceCertificate.InventoryCertificateId,
                InventoryId = inventoryBalanceDto.InventoryId,
                Quantity = inventoryBalanceDto.Quantity
            };

            var responseBalanceCertificate = await _inventoryBalanceRepository.AddAsync(requestBalance);
            return responseBalanceCertificate != null ? new InventoryBalanceDto(responseBalanceCertificate) : throw new AppException($"Failed To Create Opening Balance");
        }

        public async Task<List<InventoryBalanceDto>> GetOpeningInventoriesByVendorId(Guid vendorId)
        {
            var inventoriesBalanceDto = new List<InventoryBalanceDto>();
            var balanceCertificate = await _inventoryCertificateService.GetOpeningBalanceCertificateByVendorId(vendorId);
            if (balanceCertificate == null)
                return new List<InventoryBalanceDto>();

            var inventoriesBalance = await _inventoryBalanceRepository.GetAll().Where(b => b.InventoryCertificateId == balanceCertificate.InventoryCertificateId).ToListAsync();
            foreach (var inventory in inventoriesBalance)
            {
                inventoriesBalanceDto.Add(new InventoryBalanceDto(inventory));
            }
            return inventoriesBalanceDto;
        }
    }
}
