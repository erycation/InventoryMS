
using MSInventory.Model.Dtos;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace MSInventory.Service.Interface
{
    public interface IReportService
    {
        Task<List<StockCountSheetReportDto>> GetStockCountSheetReport(Guid locationId);
        Task<List<StockCountSheetReportDto>> GetExistingStockCountSheetReport(Guid certificateId, Guid locationId);
    }
}
