import { InventoryDto } from "./inventoryDto";

export interface InventoryInStockDto extends InventoryDto {
    inventoryQuantity: number;
    imageUrl?: string | undefined;
}
