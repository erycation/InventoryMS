import { Injectable } from "@angular/core";
import { InventoryInStockDto } from "src/app/model/Dtos/ms-inventory/inventoryInStockDto";
import { BackendService } from "src/app/util/backend.service";

@Injectable({
    providedIn: 'root'
})
export class InventoryInStockService {

    constructor(private backend: BackendService) {

    }

    async getInventoriesInStockByVendorId(vendorId : string) {
        return await this.backend.get<InventoryInStockDto[]>(`InventoriesInStock/${vendorId}`);
    }
}
