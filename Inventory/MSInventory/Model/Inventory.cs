using MSPOSAdmin.Shared;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace MSInventory.Model
{

    [Table("Inventory")]
    public class Inventory : HasId
    {
        public Inventory()
        {
            this.InventoryPrices = new HashSet<InventoryPrice>();
            this.ExpectedInventories = new HashSet<ExpectedInventory>();
            this.InventoryTransactions = new HashSet<InventoryTransaction>();
            this.InventoryBalances = new HashSet<InventoryBalance>();
        }

        public string ProductName { get; set; }
        public string Image { get; set; }
        [Column(TypeName = "decimal(18, 6)")]
        public decimal? Price { get; set; }//to be relook and replaced
        public virtual ICollection<InventoryPrice> InventoryPrices { get; set; }
        public virtual ICollection<ExpectedInventory> ExpectedInventories { get; set; }
        public virtual ICollection<InventoryTransaction> InventoryTransactions { get; set; }
        public virtual ICollection<InventoryBalance> InventoryBalances { get; set; }
    }
}
