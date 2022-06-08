
using MSInventory.Model;
using MSInventory.Repository.Interface;
using MSInventory.Shared;

namespace MSInventory.Repository
{
    public class InventoryCertificateRepository : Repository<InventoryCertificate>, IInventoryCertificateRepository
    {

        public InventoryCertificateRepository(InventoryDBContext inventoryDBContext) : base(inventoryDBContext)
        {

        }
    }
}
