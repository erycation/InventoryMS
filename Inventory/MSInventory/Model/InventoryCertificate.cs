using MSPOSAdmin.Shared;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;

namespace m2esolution.co.za.MSInventory.Model
{
    [Table("InventoryCertificate")]
    public class InventoryCertificate : HasId
    {
        public InventoryCertificate()
        {
            this.InventoryBalances = new HashSet<InventoryBalance>();
        }
        public DateTime OpeningDate { get; set; }
        public DateTime? ClosingDate { get; set; }
        [ForeignKey("Vendor")]
        public Guid VendorId { get; set; }
        [ForeignKey("GeneratedUser")]
        public Guid? GeneratedById { get; set; }
        public virtual User GeneratedUser { get; set; }
        public virtual Vendor Vendor { get; set; }
        public virtual ICollection<InventoryBalance> InventoryBalances { get; set; }
        [NotMapped]
        public int TotalQuantity
        {
            get
            {
                return InventoryBalances.Count > 0 ? InventoryBalances.Sum(x => x.Quantity) : 0;
            }
        }

    }
}

