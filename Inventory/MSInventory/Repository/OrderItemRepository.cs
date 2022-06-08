
using MSInventory.Model;
using MSInventory.Repository.Interface;
using MSInventory.Shared;

namespace MSInventory.Repository
{
    public class OrderItemRepository : Repository<OrderItem>, IOrderItemRepository
    {

        public OrderItemRepository(InventoryDBContext inventoryDBContext) : base(inventoryDBContext)
        {

        }
    }
}
