
using System;

namespace MSInventory.Shared.Utils
{
    public class ReturnResult
    {
        public int ReturnCode { get; set; }
        public Guid? InventoryCertificateId { get; set; }
        public string ReturnMessage { get; set; }
    }
}

