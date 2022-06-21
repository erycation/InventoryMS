import { VendorInvoiceDetailDto } from "./vendorInvoiceDetailDto";

export interface VendorInvoiceReportDto extends VendorInvoiceDetailDto {
    productName?: string | undefined;
    price: number;
    quantity: number;
    amount: number;
}