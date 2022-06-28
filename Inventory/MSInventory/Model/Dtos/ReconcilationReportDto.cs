using System;

namespace MSInventory.Model.Dtos
{
    public class ReconcilationReportDto
	{
		public Guid InventoryId { get; set; }
		public string InvName { get; set; }
		public decimal UnitPriceValue { get; set; }
		public int OpeningBalance { get; set; }
		public decimal TotalAmountOpeningBalance { get; set; }
		public int InventoryIn { get; set; }
		public decimal TotalAmountInventoryIn { get; set; }
		public int InventoryOut { get; set; }
		public decimal TotalAmountInventoryOut { get; set; }
		public int ClosingQuantity { get; set; }
		public decimal TotalAmountClosingQuantity { get; set; }
		public string VendorName { get; set; }
		public DateTime OpeningDate { get; set; }
		public DateTime ClosingDate { get; set; }
		public string ConfirmedBy { get; set; }
	}
}


