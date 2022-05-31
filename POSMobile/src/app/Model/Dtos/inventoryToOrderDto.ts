export interface InventoryToOrderDto {
    inventoryId: string;
    productName?: string | undefined;
    image?: string | undefined;
    price?: number | undefined;
    inventoryQuantity?: number | undefined;
    imageUrl?: string | undefined;
}
