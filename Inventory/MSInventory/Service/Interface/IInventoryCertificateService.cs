
using MSInventory.Model.Dtos;
using MSInventory.Model.Request;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace MSInventory.Service.Interface
{
    public interface IInventoryCertificateService
    {
        Task<InventoryCertificateDto> AddInventoryCertificate(InventoryCertificateDto inventoryCertificateDto);
        Task<List<InventoryCertificateDto>> GetAllInventoryCertificateByVendorId(Guid vendorId);
        Task<InventoryCertificateDto> GetOpeningBalanceCertificateByVendorId(Guid vendorId);
        Task<List<InventoryCertificateDto>> GetHistoryInventoryCertificateByVendorId(RequestHistoryInventoryCertificate requestHistoryInventoryCertificate);
    }
}
