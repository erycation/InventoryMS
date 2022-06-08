import { Injectable } from "@angular/core";
import { InventoryBalanceDto } from "src/app/model/Dtos/ms-inventory/inventoryBalanceDto";
import { BackendService } from "src/app/util/backend.service";

@Injectable({
    providedIn: 'root'
})
export class InventoryBalanceService {

    constructor(private backend: BackendService) {

    }

    createInventoryBalance(vendorId: string, inventoryBalanceDto: InventoryBalanceDto) {
        return this.backend.postWithResponse1<any>(`InventoryBalance/Add/${vendorId}`, inventoryBalanceDto);
    }

    async getOpeningInventoryByVendorId(vendorId : string) {
        return await this.backend.get<InventoryBalanceDto[]>(`InventoryBalance/GetAll/${vendorId}`);
    }
}
