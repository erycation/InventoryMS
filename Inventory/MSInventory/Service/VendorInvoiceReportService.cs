
using AspNetCore.Reporting;
using MSInventory.Model.Dtos;
using MSInventory.Model.Request;
using MSInventory.Repository.Interface;
using MSInventory.Service.Interface;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace MSInventory.Service
{
    public class VendorInvoiceReportService : IVendorInvoiceReportService
    {

        private readonly IVendorInvoiceReportRepository _vendorInvoiceReportRepository;

        public VendorInvoiceReportService(IVendorInvoiceReportRepository vendorInvoiceReportRepository)
        {
            _vendorInvoiceReportRepository = vendorInvoiceReportRepository;
        }

        public async Task<List<VendorInvoiceItemDto>> GetVendorInvoiceReportByVendorId(Guid vendorId, RequestVendorInvoice requestVendorInvoice)
        {
            return await _vendorInvoiceReportRepository.GetVendorInvoiceReportByVendorId(vendorId, requestVendorInvoice.StartDate, requestVendorInvoice.EndDate);
        }
        public async Task<byte[]> GenerateVendorInvoiceByInvoiceNumber(string invoiceNumber, string reportType)
        {
            string rdlcFilePath = string.Format("wwwroot\\ReportFiles\\VendorInvoice.rdl");
            // string[] filePaths = Directory.GetFiles(Path.Combine(this._environment.WebRootPath, "Images/"));
            Dictionary<string, string> parameters = new Dictionary<string, string>();
            Encoding.RegisterProvider(CodePagesEncodingProvider.Instance);
            Encoding.GetEncoding("windows-1252");
            LocalReport report = new LocalReport(rdlcFilePath);

            parameters.Add("InvoiceNumber", invoiceNumber.ToString());

            var vendorInvoiceDatasetValues = await _vendorInvoiceReportRepository.GetVendorInvoiceReportByInvoiceNumber(invoiceNumber);

            report.AddDataSource("DataSet1", vendorInvoiceDatasetValues);
            var result = report.Execute(GetRenderType(reportType), 1, parameters);
            return result.MainStream;

        }
        private RenderType GetRenderType(string reportType)
        {
            var renderType = RenderType.Pdf;
            switch (reportType.ToLower())
            {
                default:
                case "pdf":
                    renderType = RenderType.Pdf;
                    break;
                case "word":
                    renderType = RenderType.Word;
                    break;
                case "excel":
                    renderType = RenderType.Excel;
                    break;
            }

            return renderType;
        }
    }
}
       