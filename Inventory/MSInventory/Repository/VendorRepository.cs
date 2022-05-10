
using m2esolution.co.za.MSInventory.Model;
using m2esolution.co.za.MSInventory.Repository.Interface;
using m2esolution.co.za.MSInventory.Shared;

namespace m2esolution.co.za.MSInventory.Repository
{
    public class VendorRepository : Repository<Vendor>, IVendorRepository
    {

        public VendorRepository(InventoryDBContext inventoryDBContext) : base(inventoryDBContext)
        {

        }
    }
}
