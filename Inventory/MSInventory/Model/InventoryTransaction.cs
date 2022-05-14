using MSPOSAdmin.Shared;
using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace m2esolution.co.za.MSInventory.Model
{
    [Table("InventoryTransaction")]
    public class InventoryTransaction : HasId
    {
        public DateTime DateInserted { get; set; } = DateTime.Now;
        public string EntryType { get; set; }
        public string TransactionType { get; set; }
        public string TrackingStatus { get; set; }
        public Guid InventoryId { get; set; }
        public int Quantity { get; set; }
        public bool Accepted { get; set; }
        public string VerifiedStatus { get; set; }
        [ForeignKey("ProcessByUser")]
        public Guid ProcessById { get; set; }
        [ForeignKey("AcceptedByUser")]
        public Guid? AcceptedByUserId { get; set; }
        [ForeignKey("LocationVendor")]
        public Guid LocationVendorId { get; set; }
        [ForeignKey("DestinationVendor")]
        public Guid DestinationVendorId { get; set; }
        [ForeignKey("OrderItem")]
        public Guid? OrderItemId { get; set; }
        public bool Deleted { get; set; }
        [ForeignKey("DeletedByUser")]
        public Guid? DeletedById { get; set; }
        public string TrackingNumber { get; set; }
        [JsonIgnore]
        public virtual User ProcessByUser { get; set; }
        [JsonIgnore]
        public virtual User AcceptedByUser { get; set; }
        [JsonIgnore]
        public virtual User DeletedByUser { get; set; }
        [JsonIgnore]
        public virtual Inventory Inventory { get; set; }
        [JsonIgnore]
        public virtual Vendor LocationVendor { get; set; }
        [JsonIgnore]
        public virtual Vendor DestinationVendor { get; set; }
        [JsonIgnore]
        public virtual OrderItem OrderItem { get; set; }

    }
}
