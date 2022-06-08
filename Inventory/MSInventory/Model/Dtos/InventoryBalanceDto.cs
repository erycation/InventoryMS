using System;

namespace MSInventory.Model.Dtos
{
    public class InventoryBalanceDto
    {
        public InventoryBalanceDto()
        {

        }
        public InventoryBalanceDto(InventoryBalance inventoryBalance)
        {
            InventoryBalanceId = inventoryBalance.Id;
            InventoryCertificateId = inventoryBalance.InventoryCertificateId;
            InventoryId = inventoryBalance.InventoryId;
            Quantity = inventoryBalance.Quantity;
            InventoryName = inventoryBalance?.Inventory?.ProductName;
        }

        public Guid InventoryBalanceId { get; set; }
        public Guid InventoryCertificateId { get; set; }
        public Guid InventoryId { get; set; }
        public int Quantity { get; set; }
        public string InventoryName { get; set; }
    }
}
