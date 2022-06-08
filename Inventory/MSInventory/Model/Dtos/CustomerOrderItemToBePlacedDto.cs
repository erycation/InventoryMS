using System;

namespace MSInventory.Model.Dtos
{
    public class CustomerOrderItemToBePlacedDto
    {
        public Guid InventoryId { get; set; }
        public int Quantity { set; get; }
        public Guid CustomerId { get; set; }
        public Guid ProcessById { get; set; }
        public Guid LocationVendorId { get; set; }
    }
}
