
using MSInventory.Model;
using MSInventory.Repository.Interface;
using MSInventory.Shared;

namespace MSInventory.Repository
{
    public class ExpectedInventoryRepository : Repository<ExpectedInventory>, IExpectedInventoryRepository
    {

        public ExpectedInventoryRepository(InventoryDBContext inventoryDBContext) : base(inventoryDBContext)
        {

        }
    }
}
