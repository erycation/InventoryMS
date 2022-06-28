export interface CustomerOrderItemToBePlacedDto {
    inventoryId: string;
    quantity: number;
    amount: number;
    customerId: string;
    processById: string;
    locationVendorId: string;
    inventoryName: string;
}
