using MSPOSAdmin.Shared;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;


namespace m2esolution.co.za.MSInventory.Model
{

    [Table("OrderItem")]
    public class OrderItem : HasId
    {

        public OrderItem()
        {
            this.InventoryTransactions = new HashSet<InventoryTransaction>();
        }

        public Guid OrderId { get; set; }
        public virtual Order Order { get; set; }
        public virtual ICollection<InventoryTransaction> InventoryTransactions { get; set; }
    }
}
        