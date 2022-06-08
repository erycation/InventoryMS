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
    public class InventoryController : ControllerBase
    {
        private readonly IInventoryService _inventoryService;

        public InventoryController(IInventoryService inventoryService)
        {
            _inventoryService = inventoryService;
        }

        [HttpPost("Add")]
        public async Task<IActionResult> Add([FromBody] InventoryDto inventoryDto)
        {
            var response = await _inventoryService.AddInventory(inventoryDto);
            return Ok(new { message = $"Inventory Successfully Created.", data = response });
        }

        [HttpGet("Get/{vendorId}")]
        public async Task<InventoryDto> GetVendorById(Guid inventoryId)
        {
            return await _inventoryService.GetInventoryById(inventoryId);
        }

        [HttpPost("Update")]
        public async Task<IActionResult> Update([FromBody] InventoryDto inventoryDto)
        {
            var response = await _inventoryService.UpdateInventory(inventoryDto);
            return Ok(new { message = $"Inventory Successfully Updated.", data = response });
        }

        [HttpGet("GetAll")]       
        public async Task<ActionResult<List<InventoryDto>>> GetAllInventories()
        {
            return await _inventoryService.GetAllInventories();
        }

        [HttpGet("GetAll/ToOrder")]
        public async Task<ActionResult<List<InventoryToOrderDto>>> GetAllInventoriesToOrder()
        {
            return await _inventoryService.GetAllInventoriesToOrder();
        }

    }
}
