import { Injectable } from "@angular/core";
import { CustomerDto } from "src/app/model/Dtos/ms-inventory/customerDto";
import { VendorDto } from "src/app/model/Dtos/ms-inventory/vendorDto";
import { BackendService } from "src/app/util/backend.service";

@Injectable({
    providedIn: 'root'
})
export class CustomerService {

    constructor(private backend: BackendService) {

    }

    async getAllVendors() {
        return await this.backend.get<VendorDto[]>(`Vendor/GetAll`);
    }

    createCustomer(customerDto:CustomerDto)
    {
        return this.backend.postWithResponse1<any>(`Customer/Add`, customerDto);
    }

    updateVendor(vendorDto:VendorDto)
    {
        return this.backend.postWithResponse1<any>(`Vendor/Update`, vendorDto);
    }

    async getCustomerById(customerId : string) {
        return await this.backend.get<CustomerDto>(`Customer/Get/${customerId}`);
    }

    async searchCustomers(searchParameter : string) {
        return await this.backend.get<CustomerDto[]>(`Customer/Search/${searchParameter}`);
    }
}