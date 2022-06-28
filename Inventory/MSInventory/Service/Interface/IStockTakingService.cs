
using MSInventory.Model.Dtos;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace MSInventory.Service.Interface
{
    public interface IStockTakingService
    {
        Task<List<StockTakingDto>> GetCurrentStockTakingByVendorId(Guid locationId);
    }
}
