using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace MSInventory.Model.Dtos
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
            Image = inventory.Image;
            Price = inventory.Price;
        }

        public Guid InventoryId { get; set; }
        public string ProductName { get; set; }
        public string Image { get; set; }       
        public decimal? Price { get; set; }
    }
}
