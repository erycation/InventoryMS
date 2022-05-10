using MSPOSAdmin.Shared;
using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace m2esolution.co.za.MSInventory.Model
{


    [Table("VendorLocation")]
    public class VendorLocation : HasId
    {
        public Guid VendorId { get; set; }
        public string LocationName { get; set; }
        public bool ReceivingArea { get; set; }

        [JsonIgnore]
        public virtual Vendor Vendor { get; set; }
    }
}
