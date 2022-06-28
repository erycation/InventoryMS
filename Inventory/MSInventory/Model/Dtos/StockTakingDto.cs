using System;

namespace MSInventory.Model.Dtos
{
    public class StockTakingDto
	{
		public Guid InventoryId { get; set; }
		public string InvName { get; set; }
		public int OpeningBalance { get; set; }
		public int InventoryIn { get; set; }
		public int InventoryOut { get; set; }
		public int ClosingQuantity { get; set; }
		public string UnitPriceValue { get; set; }
		
	}
}

