
using System;

namespace MSInventory.Model.Request
{
    public class RequestHistoryInventoryCertificate : StartEndDateDto
    {
        public Guid VendorId { get; set; }
    }
}
