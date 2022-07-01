
using MSInventory.Model.Dtos;
using MSInventory.Shared.Utils;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace MSInventory.Repository.Interface
{
    public interface IReconcilationReportRepository
    {
        ReturnResult GenerateInventoryCertificate(Guid vendorId, Guid generateById);
        Task<List<ReconcilationReportDto>> GetReconReportByCertificateId(Guid inventoryCertificateId);
    }
}
