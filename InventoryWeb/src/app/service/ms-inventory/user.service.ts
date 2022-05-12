import { Injectable } from "@angular/core";
import { UserDto } from "src/app/model/Dtos/ms-inventory/userDto";
import { BackendService } from "src/app/util/backend.service";

@Injectable({
    providedIn: 'root'
})
export class UserService {

    constructor(private backend: BackendService) {

    }

    async getAdminUsers() {
        return await this.backend.get<UserDto[]>(`User/Role/Admin`);
    }
}
