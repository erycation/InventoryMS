import { Injectable } from "@angular/core";
import { StockCountSheetReportDto } from "src/app/model/Dtos/ms-inventory/stockCountSheetReportDto";
import { StockTakingDto } from "src/app/model/Dtos/ms-inventory/stockTakingDto";
import { BackendService } from "src/app/util/backend.service";

@Injectable({
    providedIn: 'root'
})
export class StockTakingService {

    constructor(private backend: BackendService) {

    }

    async getCurrentStockTakingByVendor(vendorId : string) {
        return await this.backend.get<StockTakingDto[]>(`StockTaking/Vendor/${vendorId}`);
    }
  
}
