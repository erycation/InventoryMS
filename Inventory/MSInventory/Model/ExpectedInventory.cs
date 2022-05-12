using MSPOSAdmin.Shared;
using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace m2esolution.co.za.MSInventory.Model
{
    [Table("ExpectedInventory")]
    public class ExpectedInventory : HasId
    {
        public string ReferenceNo { get; set; }
        public DateTime DateInserted { get; set; } = DateTime.Now;
        public string Supervisor { get; set; }
        [ForeignKey("User")]
        public Guid AdminId { get; set; }
        [ForeignKey("Vendor")]
        public Guid VendorId { get; set; }
        [ForeignKey("Inventory")]
        public Guid InventoryId { get; set; }
        public int Quantity { get; set; }
        public int Count1 { get; set; } = 0;
        public bool Counted { get; set; } 
        public DateTime? CountedDate { get; set; }
        public bool SendToVendor { get; set; }
        public string VarianceReason { get; set; }
        [JsonIgnore]
        public virtual Vendor Vendor { get; set; }
        [JsonIgnore]
        public virtual User User { get; set; }
        [JsonIgnore]
        public virtual Inventory Inventory { get; set; }
    }
}
