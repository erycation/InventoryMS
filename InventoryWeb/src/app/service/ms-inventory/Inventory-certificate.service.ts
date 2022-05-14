import { Injectable } from "@angular/core";
import { InventoryCertificateDto } from "src/app/model/Dtos/ms-inventory/inventoryCertificateDto";
import { BackendService } from "src/app/util/backend.service";

@Injectable({
    providedIn: 'root'
})
export class InventoryCertificateService {

    constructor(private backend: BackendService) {

    }

    async getAllInventoryCertificateByVendorId(vendorId : string) {
        return await this.backend.get<InventoryCertificateDto[]>(`InventoryCertificate/GetAll/${vendorId}`);
    }
}
