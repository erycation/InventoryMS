import { Injectable } from "@angular/core";
import { VendorDto } from "src/app/model/Dtos/ms-inventory/vendorDto";
import { BackendService } from "src/app/util/backend.service";

@Injectable({
    providedIn: 'root'
})
export class VendorService {

    constructor(private backend: BackendService) {

    }

    async getAllVendors() {
        return await this.backend.get<VendorDto[]>(`Vendor/GetAll`);
    }
}
