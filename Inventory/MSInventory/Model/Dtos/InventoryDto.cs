using System;

namespace m2esolution.co.za.MSInventory.Model.Dtos
{
    public class InventoryDto
    {
        public InventoryDto()
        {

        }
        public InventoryDto(Inventory inventory)
        {
            InventoryId = inventory.Id;
            ProductName = inventory.ProductName;
        }

        public Guid InventoryId { get; set; }
        public string ProductName { get; set; }
    }
}
