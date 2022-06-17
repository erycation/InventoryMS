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
    public class VendorInvoiceReportController : ControllerBase
    {
        private readonly IVendorInvoiceReportService _vendorInvoiceReportService;

        public VendorInvoiceReportController(IVendorInvoiceReportService vendorInvoiceReportService)
        {
            _vendorInvoiceReportService = vendorInvoiceReportService;
        }

        [HttpGet("{invoiceNumber}/{reportType}")]
        public async Task<IActionResult> CreateAndAllocateExpectedInventory(string invoiceNumber, string reportType)
        {
            var responseInvoice = await _vendorInvoiceReportService.GenerateVendorInvoiceByInvoiceNumber(invoiceNumber, reportType);
            return File(responseInvoice, System.Net.Mime.MediaTypeNames.Application.Octet, $"{invoiceNumber}.{reportType}");
        }
    }
}


