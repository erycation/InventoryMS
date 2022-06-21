using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MSInventory.Model.Dtos
{
    public class InventoryVendorDto
    {
        public Guid CustomerId { get; set; }
        public DateTime DateInserted { set; get; }
        public string Code { get; set; }
        public string FirstName { get; set; }
    }
}
