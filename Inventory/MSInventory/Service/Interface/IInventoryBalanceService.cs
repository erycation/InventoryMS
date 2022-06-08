
using MSInventory.Model.Dtos;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace MSInventory.Service.Interface
{
    public interface IInventoryBalanceService
    {
        Task<InventoryBalanceDto> AddOpeningBalance(Guid vendorId,InventoryBalanceDto inventoryBalanceDto);
        Task<List<InventoryBalanceDto>> GetOpeningInventoriesByVendorId(Guid vendorId);
    }
}
