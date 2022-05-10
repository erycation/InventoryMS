using System;

namespace m2esolution.co.za.MSInventory.Model.Dtos
{
    public class ExpectedInventoryDto
    {
        public ExpectedInventoryDto()
        {

        }
        public ExpectedInventoryDto(ExpectedInventory expectedInventory)
        {
            ExpectedInventoryId = expectedInventory.Id;
            ReferenceNo = expectedInventory.ReferenceNo;
            DateInserted = expectedInventory.DateInserted;
            Supervisor = expectedInventory.Supervisor;
            AdminId = expectedInventory.AdminId;
            VendorId = expectedInventory.VendorId;
            InventoryId = expectedInventory.InventoryId;
            Quantity = expectedInventory.Quantity;
            Counted = expectedInventory.Counted;
            CountedDate = expectedInventory.CountedDate;
            SendToVendor = expectedInventory.SendToVendor;
            VendorName = expectedInventory.Vendor.Name;
            AdminName = expectedInventory.User.Firstname;
            InventoryName = expectedInventory.Inventory.ProductName;
        }

        public Guid ExpectedInventoryId { get; set; }
        public string ReferenceNo { get; set; }
        public DateTime DateInserted { get; set; }
        public string Supervisor { get; set; }
        public Guid AdminId { get; set; }
        public Guid VendorId { get; set; }
        public Guid InventoryId { get; set; }
        public int Quantity { get; set; }
        public bool Counted { get; set; }
        public DateTime CountedDate { get; set; }
        public bool SendToVendor { get; set; }
        public string VendorName { get; set; }
        public string AdminName { get; set; }
        public string InventoryName { get; set; }
    }
}
