using MSPOSAdmin.Shared;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace MSInventory.Model
{

    [Table("Order")]
    public class Order : HasId
    {    
        public Order()
        {
            this.OrderItems = new HashSet<OrderItem>();
        }

        public DateTime DateInserted { get; set; } = DateTime.Now;
        public Guid CustomerId { get; set; }
        public string OrderNumber { get; set; }
        public virtual Customer Customer { get; set; }       
        public virtual ICollection<OrderItem> OrderItems { get; set; }
    }
}
