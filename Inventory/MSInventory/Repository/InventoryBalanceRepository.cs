
using MSInventory.Model;
using MSInventory.Repository.Interface;
using MSInventory.Shared;

namespace MSInventory.Repository
{
    public class InventoryBalanceRepository : Repository<InventoryBalance>, IInventoryBalanceRepository
    {

        public InventoryBalanceRepository(InventoryDBContext inventoryDBContext) : base(inventoryDBContext)
        {

        }
    }
}
