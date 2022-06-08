using MSPOSAdmin.Shared;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace MSInventory.Model
{


    [Table("Inv_User")]
    public class User : HasId
    {
        public User()
        {
            this.ExpectedInventories = new HashSet<ExpectedInventory>();
            this.ProcessByUsers = new HashSet<InventoryTransaction>();
            this.AcceptedByUsers = new HashSet<InventoryTransaction>();
            this.DeletedByUsers = new HashSet<InventoryTransaction>();
            this.InventoryCertificates = new HashSet<InventoryCertificate>();

        }
        public string Username { get; set; }
        public string Password { get; set; }
        public string Firstname { get; set; }
        public string Surname { get; set; }
        public string RoleDescription { get; set; }
        public bool Active { get; set; }
        public Guid VendorId { get; set; }
        [JsonIgnore]
        public virtual Vendor Vendor { get; set; }
        public virtual ICollection<ExpectedInventory> ExpectedInventories { get; set; }
        [InverseProperty("ProcessByUser")]
        public virtual ICollection<InventoryTransaction> ProcessByUsers { get; set; }
        [InverseProperty("AcceptedByUser")]
        public virtual ICollection<InventoryTransaction> AcceptedByUsers { get; set; }       
        [InverseProperty("DeletedByUser")]
        public virtual ICollection<InventoryTransaction> DeletedByUsers { get; set; }
        public virtual ICollection<InventoryCertificate> InventoryCertificates { get; set; }

    }
}
