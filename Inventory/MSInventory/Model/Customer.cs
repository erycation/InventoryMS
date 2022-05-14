
using MSPOSAdmin.Shared;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace m2esolution.co.za.MSInventory.Model
{

    [Table("Customer")]
    public class Customer : HasId
    {
        public Customer()
        {
            this.Orders = new HashSet<Order>();
        }
        public string Code { get; set; }
        public DateTime DateInserted { set; get; } = DateTime.Now;
        public string FirstName { get; set; }
        public string Surname { get; set; }
        public string CellphoneNo { get; set; }
        public string EmailAddress { get; set; }
        public Guid? LocationId { get; set; }
        public virtual ICollection<Order> Orders { get; set; }
    }
}
