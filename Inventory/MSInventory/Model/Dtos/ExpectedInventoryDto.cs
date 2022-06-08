using System;

namespace MSInventory.Model.Dtos
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
            Count1 = expectedInventory.Count1;
            Counted = expectedInventory.Counted;
            CountedDate = expectedInventory.CountedDate;
            SendToVendor = expectedInventory.SendToVendor;
            VarianceReason = expectedInventory.VarianceReason;
            VendorName = expectedInventory?.Vendor?.Name;
            AdminName = expectedInventory?.User?.Firstname;
            InventoryName = expectedInventory?.Inventory?.ProductName;
        }

        public Guid ExpectedInventoryId { get; set; }
        public string ReferenceNo { get; set; }
        public DateTime DateInserted { get; set; }
        public string Supervisor { get; set; }
        public Guid AdminId { get; set; }
        public Guid VendorId { get; set; }
        public Guid InventoryId { get; set; }
        public int Quantity { get; set; }
        public int Count1 { get; set; }
        public bool Counted { get; set; }
        public DateTime? CountedDate { get; set; }
        public bool SendToVendor { get; set; }        
        public string VarianceReason { get; set; }
        public string VendorName { get; set; }
        public string AdminName { get; set; }
        public string InventoryName { get; set; }        
        public string CountedStatus
        {
            get
            {
                return Counted == true ? "Yes" : "No";
            }
        }
        public string SendToVendorStatus
        {
            get
            {
                return SendToVendor == true ? "Yes" : "No";
            }
        }
    }
}
