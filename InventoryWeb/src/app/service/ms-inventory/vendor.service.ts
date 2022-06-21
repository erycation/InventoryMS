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

    async getNonWareHouseVendors() {
        return await this.backend.get<VendorDto[]>(`Vendor/NonWareHouse/All`);
    }

    createVendor(vendorDto: VendorDto) {
        return this.backend.postWithResponse1<any>(`Vendor/Add`, vendorDto);
    }

    async getVendorById(vendorId: string) {
        return await this.backend.get<VendorDto>(`Vendor/Get/${vendorId}`);
    }

    updateVendor(vendorDto: VendorDto) {
        return this.backend.postWithResponse1<any>(`Vendor/Update`, vendorDto);
    }
}
