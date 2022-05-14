using System;

namespace m2esolution.co.za.MSInventory.Model.Dtos
{
    public class StockCountSheetReportDto
    {
		public Guid InventoryId { get; set; }
		public string InvName { get; set; }
		public int OpeningBalance { get; set; }
		public int InventoryIn { get; set; }
		public int InventoryOut { get; set; }
		public int ClosingQuantity { get; set; }
	}
}

