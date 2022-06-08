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
