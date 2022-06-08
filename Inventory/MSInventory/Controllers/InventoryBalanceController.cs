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
    public class InventoryBalanceController : ControllerBase
    {
        private readonly IInventoryBalanceService _inventoryBalanceService;

        public InventoryBalanceController(IInventoryBalanceService inventoryBalanceService)
        {
            _inventoryBalanceService = inventoryBalanceService;
        }

        [HttpPost("Add/{vendorId}")]
        public async Task<IActionResult> Add(Guid vendorId, [FromBody] InventoryBalanceDto inventoryBalanceDto)
        {
            var response = await _inventoryBalanceService.AddOpeningBalance(vendorId, inventoryBalanceDto);
            return Ok(new { message = $"Opening Quantity Successfully Created.", data = response });
        }

        [HttpGet("GetAll/{vendorId}")]
        public async Task<ActionResult<List<InventoryBalanceDto>>> GetOpeningInventoriesByVendorId(Guid vendorId)
        {
            return await _inventoryBalanceService.GetOpeningInventoriesByVendorId(vendorId);
        }
    }
}
