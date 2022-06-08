using Microsoft.AspNetCore.Mvc;
using MSInventory.Model.Dtos;
using MSInventory.Service.Interface;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace MSInventory.Controllers
{

    [Route("api/[controller]")]
    [ApiController]
    public class ExpectedInventoryController : ControllerBase
    {
        private readonly IExpectedInventoryService _expectedInventoryService;

        public ExpectedInventoryController(IExpectedInventoryService expectedInventoryService)
        {
            _expectedInventoryService = expectedInventoryService;
        }

        [HttpPost("Create/Allocate")]
        public async Task<IActionResult> CreateAndAllocateExpectedInventory([FromBody] ExpectedInventoryDto expectedInventoryDto)
        {
            var response = await _expectedInventoryService.CreateAndAllocateExpectedInventory(expectedInventoryDto);
            return Ok(new { message = $"Expected Inventory Successfully Allocated.", data = response });
        }

        [HttpPost("Count")]
        public async Task<IActionResult> CountExpectedInventory([FromBody] ExpectedInventoryDto expectedInventoryDto)
        {
            var response = await _expectedInventoryService.CountExpectedInventory(expectedInventoryDto);
            return Ok(new { message = $"Expected Inventory Successfully Counted.", data = response });
        }

        [HttpPost("Send/Vendor/{locationId}")]
        public async Task<IActionResult> SendExpectedInventoryToVendor([FromBody] List<ExpectedInventoryDto> expectedInventoriesDto, Guid locationId)
        {
            var response = await _expectedInventoryService.SendExpectedInventoryToVendor(expectedInventoriesDto, locationId);
            return Ok(new { message = $"Expected Inventory Successfully Send To Vendor.", data = response });
        }

        [HttpGet("Get/{expectedInventoryId}")]
        public async Task<ExpectedInventoryDto> GetExpectedInventoryById(Guid expectedInventoryId)
        {
            return await _expectedInventoryService.GetExpectedInventoryById(expectedInventoryId);
        }

        [HttpGet("Allocated/Admin/{adminId}")]
        public async Task<List<ExpectedInventoryDto>> GetExpectedInventoriesAllocatedToAdmin(Guid adminId)
        {
            return await _expectedInventoryService.GetExpectedInventoriesAllocatedToAdmin(adminId);
        }

        [HttpGet("Counted/Admin/{adminId}/{vendorId}")]
        public async Task<List<ExpectedInventoryDto>> GetCountedExpectedInventoryByVendor(Guid adminId, Guid vendorId)
        {
            return await _expectedInventoryService.GetCountedExpectedInventoryByVendor(adminId, vendorId);
        }

        [HttpGet("Allocated/Supervisor/{supervisorName}")]
        public async Task<List<ExpectedInventoryDto>> GetExpectedInventoriesAllocatedToAdminBySupervisor(string supervisorName)
        {
            return await _expectedInventoryService.GetExpectedInventoriesAllocatedToAdminBySupervisor(supervisorName);
        }
    }
}
