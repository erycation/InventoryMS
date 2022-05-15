import { Injectable } from "@angular/core";
import { CustomerOrderItemToBePlacedDto } from "src/app/model/Dtos/ms-inventory/customerOrderItemToBePlacedDto";
import { InventoryTransactionDto } from "src/app/model/Dtos/ms-inventory/inventoryTransactionDto";
import { BackendService } from "src/app/util/backend.service";

@Injectable({
    providedIn: 'root'
})
export class InventoryTransactionService {

    constructor(private backend: BackendService) {

    }

    captureTransactionInventoryInToProduction(inventoryTransactionDto : InventoryTransactionDto) {
        return this.backend.postWithResponse1<any>(`InventoryTransaction/Production/Capture`, inventoryTransactionDto);
    }

     async getInventoriesAwaitingToAcceptByVendor(vendorId : string) {
        return await this.backend.get<InventoryTransactionDto[]>(`InventoryTransaction/Awaiting/Accepted/${vendorId}`);
    }

    async getUnverifiedInventoriesToAcceptByProduction(vendorId : string) {
        return await this.backend.get<InventoryTransactionDto[]>(`InventoryTransaction/Unverified/Production/${vendorId}`);
    }

    verifyInventorySendToProduction(inventoriesTransactionDto : InventoryTransactionDto[]) {
        return this.backend.postWithResponse1<any>(`InventoryTransaction/Send/Production`, inventoriesTransactionDto);
    }

    async getOutgoingInventoriesNotAcceptByVendor(vendorId : string) {
        return await this.backend.get<InventoryTransactionDto[]>(`InventoryTransaction/Outgoing/NotAccepted/${vendorId}`);
    }

    acceptTransactionInventoryInToVendor(inventoryTransactionDto : InventoryTransactionDto[], vendorId : string, userId : string) {
        return this.backend.postWithResponse1<any>(`InventoryTransaction/Accept/Vendor/${vendorId}/${userId}`, inventoryTransactionDto);
    }

    checkOutCustomerToCreateOrder(customerOrderItemToBePlacedDto : CustomerOrderItemToBePlacedDto[]) {
        return this.backend.postWithResponse1<any>(`InventoryTransaction/Customer/Order`, customerOrderItemToBePlacedDto);
    }
    /*

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
  */
}
