using MSPOSAdmin.Shared;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace m2esolution.co.za.MSInventory.Model
{

    [Table("Inventory")]
    public class Inventory : HasId
    {
        public Inventory()
        {
            this.InventoryPrices = new HashSet<InventoryPrice>();
            this.ExpectedInventories = new HashSet<ExpectedInventory>();
            this.InventoryTransactions = new HashSet<InventoryTransaction>();
        }

        public string ProductName { get; set; }
        public string Image { get; set; }     
        public virtual ICollection<InventoryPrice> InventoryPrices { get; set; }
        public virtual ICollection<ExpectedInventory> ExpectedInventories { get; set; }
        public virtual ICollection<InventoryTransaction> InventoryTransactions { get; set; }
    }
}
