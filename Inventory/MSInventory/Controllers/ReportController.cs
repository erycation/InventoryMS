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
    public class ReportController : ControllerBase
    {
        private readonly IReportService _reportService;

        public ReportController(IReportService reportService)
        {
            _reportService = reportService;
        }

        [HttpGet("StockCount/{locationId}")]       
        public async Task<List<StockCountSheetReportDto>> GetStockCountSheetReport(Guid locationId)
        {
            return await _reportService.GetStockCountSheetReport(locationId);
        }

        [HttpGet("StockCount/Existing/{certificateId}/{locationId}")]
        public async Task<List<StockCountSheetReportDto>> GetExistingStockCountSheetReport(Guid certificateId, Guid locationId)
        {
            return await _reportService.GetExistingStockCountSheetReport(certificateId, locationId);
        }
    }
}
