
export interface InventoryCertificateDto {
    inventoryCertificateId: string;
    openingDate: Date;
    closingDate?: Date | undefined;
    vendorId: string;
    generatedById?: string | undefined;
    generatedUserName?: string | undefined;
    vendorName?: string | undefined;
    totalQuantity:number;
}

