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
    public class StockTakingController : ControllerBase
    {
        private readonly IStockTakingService _stockTakingService;

        public StockTakingController(IStockTakingService stockTakingService)
        {
            _stockTakingService = stockTakingService;
        }

        [HttpGet("Vendor/{vendorId}")]       
        public async Task<List<StockTakingDto>> GetCurrentStockTakingByVendorId(Guid vendorId)
        {
            return await _stockTakingService.GetCurrentStockTakingByVendorId(vendorId);
        }

    }
}
