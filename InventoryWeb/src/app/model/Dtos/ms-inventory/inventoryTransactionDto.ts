export interface InventoryTransactionDto {
    inventoryTransactionId: string;
    dateInserted: Date;
    entryType?: string | undefined;
    transactionType?: string | undefined;
    trackingStatus?: string | undefined;
    inventoryId: string;
    quantity: number;
    accepted: boolean;
    verifiedStatus?: string | undefined;
    processById: string;
    locationVendorId: string;
    destinationVendorId: string;
    orderItemId?: string | undefined;
    deleted: boolean;
    deletedById?: string | undefined;
    userPerocessed?: string | undefined;
    userDeleted?: string | undefined;
    inventoryName?: string | undefined;
    locationVendorName?: string | undefined;
    destinationVendorName?: string | undefined;
    trackingNumber?: string | undefined;
}
