
using MSInventory.Model;
using MSInventory.Repository.Interface;
using MSInventory.Shared;

namespace MSInventory.Repository
{
    public class CustomerRepository : Repository<Customer>, ICustomerRepository
    {

        public CustomerRepository(InventoryDBContext inventoryDBContext) : base(inventoryDBContext)
        {

        }
    }
}
