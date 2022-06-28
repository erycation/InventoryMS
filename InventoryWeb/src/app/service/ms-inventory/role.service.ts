import { Injectable } from "@angular/core";
import { RoleDto } from "src/app/model/Dtos/ms-inventory/roleDto";
import { BackendService } from "src/app/util/backend.service";

@Injectable({
    providedIn: 'root'
})
export class RoleService {

    constructor(private backend: BackendService) {

    }

    async getAllRoles() {
        return await this.backend.get<RoleDto[]>(`Role/GetAll`);
    }

    async getRolesByVendor(vendorType: string) {
        return await this.backend.get<RoleDto[]>(`Role/Get/${vendorType}`);
    }

    async getAllNonCustomerRoles() {
        return await this.backend.get<RoleDto[]>(`Role/NonCustomer/All`);
    }
}
