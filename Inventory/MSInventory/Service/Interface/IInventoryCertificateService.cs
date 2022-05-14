
using m2esolution.co.za.MSInventory.Model.Dtos;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace m2esolution.co.za.MSInventory.Service.Interface
{
    public interface IInventoryCertificateService
    {
        Task<List<InventoryCertificateDto>> GetAllInventoryCertificateByVendorId(Guid vendorId);
    }
}
