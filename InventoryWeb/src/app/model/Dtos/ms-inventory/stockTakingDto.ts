export interface StockTakingDto {
    inventoryId: string;
    invName?: string | undefined;
    openingBalance: number;
    inventoryIn: number;
    inventoryOut: number;
    closingQuantity: number;
    unitPriceValue?: string | undefined;
}