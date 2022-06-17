import { Injectable } from "@angular/core";
import { StockCountSheetReportDto } from "src/app/model/Dtos/ms-inventory/stockCountSheetReportDto";
import { BackendService } from "src/app/util/backend.service";

@Injectable({
    providedIn: 'root'
})
export class VendorInvoiceReportService {

    constructor(private backend: BackendService) {
    }

    async downloadVendorInvoiceReport(invoiceNumber: string, reportType: string) {
        return await this.backend.downloadFilePDF(`VendorInvoiceReport/${invoiceNumber}/${reportType}`);
    }
}
