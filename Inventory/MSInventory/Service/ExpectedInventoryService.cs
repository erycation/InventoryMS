

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
    public class ExpectedInventoryService : IExpectedInventoryService
    {

        private readonly IExpectedInventoryRepository _expectedInventoryRepository;
        private IInventoryTransactionService _inventoryTransactionService;

        public ExpectedInventoryService(IExpectedInventoryRepository expectedInventoryRepository,
                                        IInventoryTransactionService inventoryTransactionService)
        {
            _expectedInventoryRepository = expectedInventoryRepository;
            _inventoryTransactionService = inventoryTransactionService;
        }

        public async Task<ExpectedInventoryDto> CreateAndAllocateExpectedInventory(ExpectedInventoryDto expectedInventoryDto)
        {

            expectedInventoryDto.ReferenceNo = Guid.NewGuid().ToString();

            var requestExpectedInventory = new ExpectedInventory
            {
                ReferenceNo = expectedInventoryDto.ReferenceNo,
                Supervisor = expectedInventoryDto.Supervisor,
                AdminId = expectedInventoryDto.AdminId,
                VendorId = expectedInventoryDto.VendorId,
                InventoryId = expectedInventoryDto.InventoryId,
                Quantity = expectedInventoryDto.Quantity,
                Counted = false,
                CountedDate = null,
                SendToVendor = false,
                VarianceReason = "None",
            };

            var responseExpectedInventory = await _expectedInventoryRepository.AddAsync(requestExpectedInventory);
            return responseExpectedInventory != null ? new ExpectedInventoryDto(responseExpectedInventory) : throw new AppException($"Failed To Allocate Inventory");

        }

        public async Task<ExpectedInventoryDto> GetExpectedInventoryById(Guid expectedInventoryId)
        {
            var expectedInventory = await _expectedInventoryRepository.GetAll().FirstOrDefaultAsync(x => x.Id == expectedInventoryId);
            return expectedInventory != null ? new ExpectedInventoryDto(expectedInventory) : throw new AppException($"Expected Inventory Not Found");
        }

        public async Task<List<ExpectedInventoryDto>> GetExpectedInventoriesAllocatedToAdmin(Guid adminId)
        {
            var expectedInventoriesDto = new List<ExpectedInventoryDto>();
            var expectedInventories = await _expectedInventoryRepository.GetAll().Where(x => x.AdminId == adminId && !x.SendToVendor).ToListAsync();// x => x.Id == expectedInventoryId);
            foreach (var expectedInventory in expectedInventories)
            {
                expectedInventoriesDto.Add(new ExpectedInventoryDto(expectedInventory));
            }
            return expectedInventoriesDto;
        }

        public async Task<List<ExpectedInventoryDto>> GetCountedExpectedInventoryByVendor(Guid adminId, Guid vendorId)
        {
            var expectedInventoriesDto = new List<ExpectedInventoryDto>();
            var expectedInventories = await _expectedInventoryRepository.GetAll().Where(x => x.AdminId == adminId && !x.SendToVendor && x.VendorId == vendorId).ToListAsync();// x => x.Id == expectedInventoryId);
            foreach (var expectedInventory in expectedInventories)
            {
                expectedInventoriesDto.Add(new ExpectedInventoryDto(expectedInventory));
            }
            return expectedInventoriesDto;
        }

        public async Task<List<ExpectedInventoryDto>> GetExpectedInventoriesAllocatedToAdminBySupervisor(string supervisorName)
        {
            var expectedInventoriesDto = new List<ExpectedInventoryDto>();
            var expectedInventories = await _expectedInventoryRepository.GetAll().Where(x => x.Supervisor == supervisorName && !x.SendToVendor).ToListAsync();// x => x.Id == expectedInventoryId);
            foreach (var expectedInventory in expectedInventories)
            {
                expectedInventoriesDto.Add(new ExpectedInventoryDto(expectedInventory));
            }
            return expectedInventoriesDto;
        }

        public async Task<ExpectedInventoryDto> CountExpectedInventory(ExpectedInventoryDto expectedInventoryDto)
        {
            var expectedInventory = await _expectedInventoryRepository.GetAll().AsNoTracking().FirstOrDefaultAsync(x => x.Id == expectedInventoryDto.ExpectedInventoryId);
            if (expectedInventory == null)
                throw new AppException($"Expected Inventory Not Found");

            expectedInventory.Count1 = expectedInventoryDto.Count1;
            expectedInventory.VarianceReason = expectedInventoryDto.VarianceReason;
            expectedInventory.Counted = true;
            expectedInventory.CountedDate = DateTime.Now;
            var responseExpectedInventory = await _expectedInventoryRepository.UpdateAsync(expectedInventory);
            return responseExpectedInventory != null ? new ExpectedInventoryDto(responseExpectedInventory) : throw new AppException($"Failed To Count Expected Inventory");
        }
      
        public async Task<ExpectedInventoryDto> SendExpectedInventoryToVendor(List<ExpectedInventoryDto> expectedInventoriesDto, Guid locationId)
        {
            var trackingNumber = $"AEON_{DateTime.Now:yyyyMMddHHmmss}_{Guid.NewGuid().ToString().Substring(1,5)}";
            foreach (var expectedInventoryDto in expectedInventoriesDto)
            {
                var expectedInventory = await _expectedInventoryRepository.GetAll().FirstOrDefaultAsync(x => x.Id == expectedInventoryDto.ExpectedInventoryId);
                if (expectedInventory == null)
                    throw new AppException($"Expected Inventory Not Found");
                expectedInventory.SendToVendor = true;
                var responseExpectedInventory = await _expectedInventoryRepository.UpdateAsync(expectedInventory);

                if (responseExpectedInventory == null)
                    throw new AppException($"Failed To Count Expected Inventory");

                await _inventoryTransactionService.DebitThroughExpectedInventoryTransaction(expectedInventoryDto, locationId, trackingNumber);
                await _inventoryTransactionService.CreditFromExpectedInventoryTransaction(expectedInventoryDto, locationId, trackingNumber);


            }
            return new ExpectedInventoryDto();
        }
    }
}
