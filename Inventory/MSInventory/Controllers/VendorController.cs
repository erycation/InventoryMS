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
    public class VendorController : ControllerBase
    {
        private readonly IVendorService _vendorService;

        public VendorController(IVendorService vendorService)
        {
            _vendorService = vendorService;
        }

        [HttpPost("Add")]
        public async Task<IActionResult> Add([FromBody] VendorDto vendorDto)
        {
            var response = await _vendorService.AddVendor(vendorDto);
            return Ok(new { message = $"Vendor Successfully Created.", data = response });
        }

        [HttpGet("Get/{vendorId}")]
        public async Task<VendorDto> GetVendorById(Guid vendorId)
        {
            return await _vendorService.GetVendorById(vendorId);
        }

        [HttpPost("Update")]
        public async Task<IActionResult> Update([FromBody] VendorDto vendorDto)
        {
            var response = await _vendorService.UpdateVendor(vendorDto);
            return Ok(new { message = $"Vendor Successfully Updated.", data = response });
        }

        [HttpGet("GetAll")]       
        public async Task<ActionResult<List<VendorDto>>> GetAllVendors()
        {
            return await _vendorService.GetAllVendors();
        }

        [HttpGet("NonWareHouse/All")]
        public async Task<ActionResult<List<VendorDto>>> GetNonWarehouseVendors()
        {
            return await _vendorService.GetNonWarehouseVendors();
        }
    }
}
