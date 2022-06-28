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
    public class ReconcilationReportController : ControllerBase
    {
        private readonly IReconcilationReportService _reconcilationReportService;

        public ReconcilationReportController(IReconcilationReportService reconcilationReportService)
        {
            _reconcilationReportService = reconcilationReportService;
        }

        [HttpPost("Generate")]
        public IActionResult GenerateInventoryCertificate([FromBody] UserGenerateInvCertDto userGenerateInvCertDto)
        {
            var response =  _reconcilationReportService.GenerateInventoryCertificate(userGenerateInvCertDto);
            return Ok(new { message = $"Certificate successfully generated.", data = response });
        }

        [HttpGet("{inventoryCertificateId}/{reportType}")]
        public async Task<IActionResult> CreateAndAllocateExpectedInventory(Guid inventoryCertificateId, string reportType)
        {
            var responseInvoice = await _reconcilationReportService.GenerateReconReportByCertificateId(inventoryCertificateId, reportType);
            return File(responseInvoice, System.Net.Mime.MediaTypeNames.Application.Octet, $"{inventoryCertificateId}.{reportType}");
        }

    }
}
