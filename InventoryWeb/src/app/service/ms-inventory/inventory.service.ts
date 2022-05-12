import { Injectable } from "@angular/core";
import { InventoryDto } from "src/app/model/Dtos/ms-inventory/inventoryDto";
import { BackendService } from "src/app/util/backend.service";

@Injectable({
    providedIn: 'root'
})
export class InventoryService {

    constructor(private backend: BackendService) {

    }

    async getAllInventories() {
        return await this.backend.get<InventoryDto[]>(`Inventory/GetAll`);
    }
}
