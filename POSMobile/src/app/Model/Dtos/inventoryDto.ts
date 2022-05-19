export interface InventoryDto {
    inventoryId: string;
    productName?: string | undefined;
    image?: string | undefined;
    price?: number | undefined;
    inventoryQuantity?: number | undefined;
}
