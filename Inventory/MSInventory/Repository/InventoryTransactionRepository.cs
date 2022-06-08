
using MSInventory.Model;
using MSInventory.Repository.Interface;
using MSInventory.Shared;

namespace MSInventory.Repository
{
    public class InventoryTransactionRepository : Repository<InventoryTransaction>, IInventoryTransactionRepository
    {

        public InventoryTransactionRepository(InventoryDBContext inventoryDBContext) : base(inventoryDBContext)
        {

        }
    }
}
