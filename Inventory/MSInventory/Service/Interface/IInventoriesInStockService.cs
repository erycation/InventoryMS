
using MSInventory.Model.Dtos;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace MSInventory.Service.Interface
{
    public interface IInventoriesInStockService
    {
        Task<List<InventoryInStockDto>> GetInventoriesInStockByVendorId(Guid vendorId);
    }
}
