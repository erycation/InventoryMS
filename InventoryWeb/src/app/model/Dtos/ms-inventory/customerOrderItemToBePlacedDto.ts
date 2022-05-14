export interface CustomerOrderItemToBePlacedDto {
    inventoryId: string;
    quantity: number;
    customerId: string;
    processById: string;
    locationVendorId: string;
    inventoryName: string;
}
