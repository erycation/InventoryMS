import { Injectable } from "@angular/core";
import { ExpectedInventoryDto } from "src/app/model/Dtos/ms-inventory/expectedInventoryDto";
import { BackendService } from "src/app/util/backend.service";

@Injectable({
    providedIn: 'root'
})
export class ExpectedInventoryService {

    constructor(private backend: BackendService) {

    }

    async getAllocatedExpectedInventoriesBySupervisor(name : string) {
        return await this.backend.get<ExpectedInventoryDto[]>(`ExpectedInventory/Allocated/Supervisor/${name}`);
    }

    async getAllocatedExpectedInventoriesByAdmin(userId : string) {
        return await this.backend.get<ExpectedInventoryDto[]>(`ExpectedInventory/Allocated/Admin/${userId}`);
    }

    async getCountedExpectedInventoryByVendor(userId : string, vendorId : string) {
        return await this.backend.get<ExpectedInventoryDto[]>(`ExpectedInventory/Counted/Admin/${userId}/${vendorId}`);
    }
    
    createAndAllocateExpectedInventory(expectedInventoryDto : ExpectedInventoryDto) {
        return this.backend.postWithResponse1<any>(`ExpectedInventory/Create/Allocate`, expectedInventoryDto);
    }

    countExpectedInventory(expectedInventoryDto : ExpectedInventoryDto) {
        return this.backend.postWithResponse1<any>(`ExpectedInventory/Count`, expectedInventoryDto);
    }

    sendExpectedInventoryToVendor(expectedInventoryDto : ExpectedInventoryDto[], locationId : string) {
        return this.backend.postWithResponse1<any>(`ExpectedInventory/Send/Vendor/${locationId}`, expectedInventoryDto);
    }
  
    /*
   

    async getProvincesByName(name: string) {
        return await this.backend.get<ProvinceDto[]>(`Country/Province/Get/${name}`);
    }

    async getPostalCodesByCode(name: string) {
        return await this.backend.get<PostalCodeDto[]>(`Country/PostalCode/Get/${name}`);
    }

    async getCityByName(name: string) {
        return await this.backend.get<CityDto[]>(`Country/City/Get/${name}`);
    }

    async getSuburbByName(name: string) {
        return await this.backend.get<SuburbDto[]>(`Country/Suburb/Get/${name}`);
    }
    */
}
