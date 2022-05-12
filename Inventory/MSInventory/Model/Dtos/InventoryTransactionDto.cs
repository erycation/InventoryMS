using System;

namespace m2esolution.co.za.MSInventory.Model.Dtos
{
    public class InventoryTransactionDto
    {
        public InventoryTransactionDto()
        {

        }
        public InventoryTransactionDto(InventoryTransaction inventoryTransaction)
        {

            InventoryTransactionId = inventoryTransaction.Id;
            DateInserted = inventoryTransaction.DateInserted;
            EntryType = inventoryTransaction.EntryType;
            TransactionType = inventoryTransaction.TransactionType;
            TrackingStatus = inventoryTransaction.TrackingStatus;
            InventoryId = inventoryTransaction.InventoryId;
            Quantity = inventoryTransaction.Quantity;
            Accepted = inventoryTransaction.Accepted;
            VerifiedStatus = inventoryTransaction.VerifiedStatus;
            ProcessById = inventoryTransaction.ProcessById;
            LocationVendorId = inventoryTransaction.LocationVendorId;
            DestinationVendorId = inventoryTransaction.DestinationVendorId;
            OrderItemId = inventoryTransaction.OrderItemId;
            Deleted = inventoryTransaction.Deleted;
            DeletedById = inventoryTransaction.DeletedById;
            UserPerocessed = inventoryTransaction?.ProcessByUser?.Username;
            UserDeleted = inventoryTransaction?.DeletedByUser?.Username;
            InventoryName = inventoryTransaction?.Inventory?.ProductName;
            LocationVendorName = inventoryTransaction?.LocationVendor?.Name;
            DestinationVendorName = inventoryTransaction?.DestinationVendor?.Name;
            TrackingNumber = inventoryTransaction.TrackingNumber;

        }

        public Guid InventoryTransactionId { get; set; }
        public DateTime DateInserted { get; set; }
        public string EntryType { get; set; }
        public string TransactionType { get; set; }
        public string TrackingStatus { get; set; }
        public Guid InventoryId { get; set; }
        public int Quantity { get; set; }
        public bool Accepted { get; set; }
        public string VerifiedStatus { get; set; }
        public Guid ProcessById { get; set; }
        public Guid LocationVendorId { get; set; }
        public Guid DestinationVendorId { get; set; }
        public Guid? OrderItemId { get; set; }
        public bool Deleted { get; set; }
        public Guid? DeletedById { get; set; }
        public string UserPerocessed { get; set; }
        public string UserDeleted { get; set; }
        public string InventoryName { get; set; }
        public string LocationVendorName { get; set; }
        public string DestinationVendorName { get; set; }
        public string TrackingNumber { get; set; }
        
    }
}
