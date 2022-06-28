using MSInventory.Model.Dtos;
using MSInventory.Shared.Utils;
using System;
using System.Threading.Tasks;

namespace MSInventory.Service.Interface
{
    public interface IReconcilationReportService
    {
        ReturnResult GenerateInventoryCertificate(UserGenerateInvCertDto userGenerateInvCertDto);
        Task<byte[]> GenerateReconReportByCertificateId(Guid inventoryCertificateId, string reportType);
    }
}
