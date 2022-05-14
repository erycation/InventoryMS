import { Injectable } from "@angular/core";
import { StockCountSheetReportDto } from "src/app/model/Dtos/ms-inventory/stockCountSheetReportDto";
import { BackendService } from "src/app/util/backend.service";

@Injectable({
    providedIn: 'root'
})
export class ReportService {

    constructor(private backend: BackendService) {

    }

    async getStockCountSheetReportByLocation(locationId : string) {
        return await this.backend.get<StockCountSheetReportDto[]>(`Report/StockCount/${locationId}`);
    }

    async getExistingStockCountSheetReportByLocation(certificateId :string, locationId : string) {
        return await this.backend.get<StockCountSheetReportDto[]>(`Report/StockCount/Existing/${certificateId}/${locationId}`);
    }

  
}
