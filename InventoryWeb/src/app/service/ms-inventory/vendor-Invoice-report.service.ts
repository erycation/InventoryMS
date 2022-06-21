import { Injectable } from "@angular/core";
import { StockCountSheetReportDto } from "src/app/model/Dtos/ms-inventory/stockCountSheetReportDto";
import { VendorInvoiceItemDto } from "src/app/model/Dtos/ms-inventory/vendorInvoiceItemDto";
import { BackendService } from "src/app/util/backend.service";

@Injectable({
    providedIn: 'root'
})
export class VendorInvoiceReportService {

    constructor(private backend: BackendService) {
    }

    async getVendorInvoiceByVendorId(vendorId: string, params: any) {
        return await this.backend.get<VendorInvoiceItemDto[]>(`VendorInvoiceReport/GetAll/${vendorId}`, params);
    }

    async downloadVendorInvoiceReport(invoiceNumber: string, reportType: string) {
        return await this.backend.downloadFilePDF(`VendorInvoiceReport/${invoiceNumber}/${reportType}`);
    }
}
