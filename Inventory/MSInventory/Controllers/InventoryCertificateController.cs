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
    public class InventoryCertificateController : ControllerBase
    {
        private readonly IInventoryCertificateService _inventoryCertificateService;

        public InventoryCertificateController(IInventoryCertificateService inventoryCertificateService)
        {
            _inventoryCertificateService = inventoryCertificateService;
        }

        [HttpGet("GetAll/{vendorId}")]       
        public async Task<ActionResult<List<InventoryCertificateDto>>> GetAllInventoryCertificateByVendorId(Guid vendorId)
        {
            return await _inventoryCertificateService.GetAllInventoryCertificateByVendorId(vendorId);
        }
    }
}
