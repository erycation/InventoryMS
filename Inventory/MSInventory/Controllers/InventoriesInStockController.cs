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
    public class InventoriesInStockController : ControllerBase
    {
        private readonly IInventoriesInStockService _inventoriesInStockService;

        public InventoriesInStockController(IInventoriesInStockService inventoriesInStockService)
        {
            _inventoriesInStockService = inventoriesInStockService;
        }

        [HttpGet("{vendorId}")]       
        public async Task<List<InventoryInStockDto>> GetInventoriesInStockByVendorId(Guid vendorId)
        {
            return await _inventoriesInStockService.GetInventoriesInStockByVendorId(vendorId);
        }

    }
}
