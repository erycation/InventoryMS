using MSInventory.Model.Dtos;
using MSInventory.Repository.Interface;
using MSInventory.Shared;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using MSInventory.Shared.Utils;
using System.Linq;

namespace MSInventory.Repository
{
    public class ReconcilationReportRepository : IReconcilationReportRepository
    {

        private readonly InventoryDBContext _inventoryDBContext;

        public ReconcilationReportRepository(InventoryDBContext inventoryDBContext)
        {
            _inventoryDBContext = inventoryDBContext;
        }

        public ReturnResult GenerateInventoryCertificate(Guid vendorId, Guid generateById)
        {
            return _inventoryDBContext.ReturnResults.FromSqlRaw("sp_generateInventoryCertificate @vendorId, @generateById",
                                                                       new SqlParameter("@vendorId", vendorId),
                                                                       new SqlParameter("@generateById", generateById)).ToList().FirstOrDefault();
        }

        public async Task<List<ReconcilationReportDto>> GetReconReportByCertificateId(Guid inventoryCertificateId)
        {
            return await _inventoryDBContext.ReconcilationReportDtos.FromSqlRaw("sp_getPrevStockTakingByCertificateId @InventoryCertificateId",
                                                                       new SqlParameter("@InventoryCertificateId", inventoryCertificateId)).ToListAsync();
        }

    }
}
