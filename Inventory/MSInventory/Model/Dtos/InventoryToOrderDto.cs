
namespace MSInventory.Model.Dtos
{
    public class InventoryToOrderDto : InventoryDto
    {

        public InventoryToOrderDto()
        {


        }
        public InventoryToOrderDto(Inventory inventory)
        {
            InventoryId = inventory.Id;
            ProductName = inventory.ProductName;
            Image = inventory.Image;
            Price = inventory.Price;
            InventoryQuantity = 0;
            ImageUrl = $"https://localhost:44385/api/FileEnvironment/getfile/{inventory.Image}";
        }

        public int InventoryQuantity { get; set; }
        public string ImageUrl { get; set; }
    }
}


