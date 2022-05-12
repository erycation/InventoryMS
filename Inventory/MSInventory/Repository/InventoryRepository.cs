
using m2esolution.co.za.MSInventory.Model;
using m2esolution.co.za.MSInventory.Repository.Interface;
using m2esolution.co.za.MSInventory.Shared;

namespace m2esolution.co.za.MSInventory.Repository
{
    public class InventoryRepository : Repository<Inventory>, IInventoryRepository
    {

        public InventoryRepository(InventoryDBContext inventoryDBContext) : base(inventoryDBContext)
        {

        }
    }
}
