using Microsoft.AspNetCore.Mvc;
using m2esolution.co.za.MSInventory.Model.Dtos;
using m2esolution.co.za.MSInventory.Service.Interface;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace m2esolution.co.za.MSInventory.Controllers
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

        //[HttpPost("Add")]
        //public async Task<IActionResult> Add([FromBody] VendorDto vendorDto)
        //{
        //    var response = await _vendorService.AddVendor(vendorDto);
        //    return Ok(new { message = $"Vendor Successfully Created.", data = response });
        //}

        //[HttpGet("Get/{vendorId}")]
        //public async Task<VendorDto> GetVendorById(Guid vendorId)
        //{
        //    return await _vendorService.GetVendorById(vendorId);
        //}

        //[HttpPost("Update")]
        //public async Task<IActionResult> Update([FromBody] VendorDto vendorDto)
        //{
        //    var response = await _vendorService.UpdateVendor(vendorDto);
        //    return Ok(new { message = $"Vendor Successfully Updated.", data = response });
        //}

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
