
using AspNetCore.Reporting;
using MSInventory.Model.Dtos;
using MSInventory.Model.Request;
using MSInventory.Repository.Interface;
using MSInventory.Service.Interface;
using MSInventory.Shared.Helpers;
using MSInventory.Shared.Utils;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace MSInventory.Service
{
    public class ReconcilationReportService : IReconcilationReportService
    {

        private readonly IReconcilationReportRepository _reconcilationReportRepository;

        public ReconcilationReportService(IReconcilationReportRepository reconcilationReportRepository)
        {
            _reconcilationReportRepository = reconcilationReportRepository;
        }

        
        public ReturnResult GenerateInventoryCertificate(UserGenerateInvCertDto userGenerateInvCertDto)
        {
            var results =  _reconcilationReportRepository.GenerateInventoryCertificate(userGenerateInvCertDto.VendorId, userGenerateInvCertDto.GenerateById); 
            if(results.ReturnCode == 1)
                throw new AppException($"{results.ReturnMessage}");
            return results;
        }

        
        public async Task<byte[]> GenerateReconReportByCertificateId(Guid certificateId, string reportType)
        {
            string rdlcFilePath = string.Format("wwwroot\\ReportFiles\\ReconCertReport.rdl");
            // string[] filePaths = Directory.GetFiles(Path.Combine(this._environment.WebRootPath, "Images/"));
            Dictionary<string, string> parameters = new Dictionary<string, string>();
            Encoding.RegisterProvider(CodePagesEncodingProvider.Instance);
            Encoding.GetEncoding("windows-1252");
            LocalReport report = new LocalReport(rdlcFilePath);

            parameters.Add("InventoryCertificateId", certificateId.ToString());

            var reconcilationDatasetValues = await _reconcilationReportRepository.GetVendorInvoiceReportByInvoiceNumber(certificateId);

            report.AddDataSource("DataSet1", reconcilationDatasetValues);
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
       