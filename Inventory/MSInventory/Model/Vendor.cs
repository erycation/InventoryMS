using MSPOSAdmin.Shared;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace m2esolution.co.za.MSInventory.Model
{


    [Table("Vendor")]
    public class Vendor : HasId
    {
        public Vendor()
        {
            this.Users = new HashSet<User>();
            this.VendorLocations = new HashSet<VendorLocation>();
            this.ExpectedInventories = new HashSet<ExpectedInventory>();
            this.LocationVendors = new HashSet<InventoryTransaction>();
            this.LocationVendors = new HashSet<InventoryTransaction>();
        }

        public string Name { get; set; }
        public string Code { get; set; }        
        public virtual ICollection<User> Users { get; set; }
        public virtual ICollection<VendorLocation> VendorLocations { get; set; }
        public virtual ICollection<ExpectedInventory> ExpectedInventories { get; set; }
        [InverseProperty("LocationVendor")]
        public virtual ICollection<InventoryTransaction> LocationVendors { get; set; }
        [InverseProperty("DestinationVendor")]
        public virtual ICollection<InventoryTransaction> DestinationVendors { get; set; }
    }
}
