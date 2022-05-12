export interface ExpectedInventoryDto {
    expectedInventoryId: string;
    referenceNo?: string | undefined;
    dateInserted: Date;
    supervisor?: string | undefined;
    adminId: string;
    vendorId: string;
    inventoryId: string;
    quantity: number;
    count1: number;
    counted: boolean;
    countedDate?: Date | undefined;
    sendToVendor: boolean;
    varianceReason?: string | undefined;
    vendorName?: string | undefined;
    adminName?: string | undefined;
    inventoryName?: string | undefined;
    countedStatus?: string | undefined;
    sendToVendorStatus?: string | undefined;
}


