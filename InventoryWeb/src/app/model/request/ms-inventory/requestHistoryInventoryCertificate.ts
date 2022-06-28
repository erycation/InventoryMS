import { StartEndDateDto } from "./startEndDateDto";

export interface RequestHistoryInventoryCertificate extends StartEndDateDto {
    vendorId: string;     
}