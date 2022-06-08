using MSPOSAdmin.Shared;
using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace MSInventory.Model
{


    [Table("InventoryPrice")]
    public class InventoryPrice : HasId
    {
        public Guid ProductId { get; set; }
        public decimal Price { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime? EndDate { get; set; }
        [JsonIgnore]
        public virtual Inventory Inventory { get; set; }
    }
}
