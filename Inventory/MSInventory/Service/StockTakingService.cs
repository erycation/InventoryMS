

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
    public class StockTakingService : IStockTakingService
    {

        private readonly IStockTakingRepository _stockTakingRepository;

        public StockTakingService(IStockTakingRepository stockTakingRepository)
        {
            _stockTakingRepository = stockTakingRepository;
        }

        public async Task<List<StockTakingDto>> GetCurrentStockTakingByVendorId(Guid locationId)
        {
            return await _stockTakingRepository.GetCurrentStockTakingByVendorId(locationId);
        }
    }
}
       