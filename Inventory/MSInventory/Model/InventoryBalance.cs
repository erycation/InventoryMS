using MSPOSAdmin.Shared;
using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace MSInventory.Model
{
    [Table("InventoryBalance")]
    public class InventoryBalance : HasId
    {
        [ForeignKey("InventoryCertificate")]
        public Guid InventoryCertificateId { get; set; }
        [ForeignKey("Inventory")]
        public Guid InventoryId { get; set; }
        public int Quantity { get; set; }
        public virtual InventoryCertificate InventoryCertificate { get; set; }
        public virtual Inventory Inventory { get; set; }
    }
}
