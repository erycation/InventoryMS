export interface StockCountSheetReportDto {
    inventoryId: string;
    invName?: string | undefined;
    openingBalance: number;
    inventoryIn: number;
    inventoryOut: number;
    closingQuantity: number;
}
