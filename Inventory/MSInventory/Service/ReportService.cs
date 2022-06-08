

using Microsoft.EntityFrameworkCore;
using MSInventory.Model;
using MSInventory.Model.Dtos;
using MSInventory.Repository.Interface;
using MSInventory.Service.Interface;
using MSInventory.Shared.Helpers;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace MSInventory.Service
{
    public class ReportService : IReportService
    {

        private readonly IReportRepository _reportRepository;

        public ReportService(IReportRepository reportRepository)
        {
            _reportRepository = reportRepository;
        }

        public async Task<List<StockCountSheetReportDto>> GetStockCountSheetReport(Guid locationId)
        {
            return await _reportRepository.GetStockCountSheetReport(locationId);
        }
        public async Task<List<StockCountSheetReportDto>> GetExistingStockCountSheetReport(Guid certificateId, Guid locationId)
        {
            return await _reportRepository.GetExistingStockCountSheetReport(certificateId, locationId);
        }
    }
}
       