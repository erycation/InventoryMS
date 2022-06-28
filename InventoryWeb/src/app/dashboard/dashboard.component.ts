import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ExpectedInventoryDto } from '../model/Dtos/ms-inventory/expectedInventoryDto';
import { InventoryTransactionDto } from '../model/Dtos/ms-inventory/inventoryTransactionDto';
import { AccountService } from '../service/account.service';
import { ExpectedInventoryService } from '../service/ms-inventory/expected-inventory.service';
import { InventoryTransactionService } from '../service/ms-inventory/inventory-transaction.service';
import { DialogService } from '../shared/dialog/dialog.service';
import { ModalResetParams } from '../shared/modal-reset-params';
import { SharedFunction } from '../shared/shared-function';
import { AcceptInventoryComponent } from './accept-inventory/accept-inventory.component';

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css']
})
export class DashboardComponent extends ModalResetParams implements OnInit {

  expectedInventoryDto: ExpectedInventoryDto[] = [];
  countedItems : number = 0;
  allocatedItems : number = 0;

  inventoriesAwaitingForAccepted: number = 0;
  inventoriesOutgoingNotAccepted: number = 0;
  inventoriesTransactionDto: InventoryTransactionDto[] = [];
  outgoingInventoriesTransactionDto: InventoryTransactionDto[] = [];

  constructor(accountService: AccountService,
    router: Router,
    private dialogService: DialogService,
    private expectedInventoryService: ExpectedInventoryService,
    private inventoryTransactionService: InventoryTransactionService) {
    super(accountService,
      router);
  }

  async ngOnInit() {
    if(this.adminRight())
      await this.loadAllocatedInventories();
  }

  async loadAllocatedInventories()
  {

    this.countedItems = 0;
    this.allocatedItems = 0;
    this.expectedInventoryDto = await this.expectedInventoryService.getAllocatedExpectedInventoriesByAdmin(this.user.userId);
    this.expectedInventoryDto.forEach(element => {
      if(element.counted)
      {
         this.countedItems++;
      }
      else{
        this.allocatedItems++;
      }
    })
  }

  async loadInventoriesToAccepted() {
    this.inventoriesTransactionDto = await this.inventoryTransactionService.getInventoriesAwaitingToAcceptByVendor(this.user.vendorId);
    this.inventoriesAwaitingForAccepted = 0;
    this.inventoriesTransactionDto.forEach(element => {
      this.inventoriesAwaitingForAccepted += Number(element.quantity);     
    })
  }

  async loadOutgoingInventoriesNoTAccepted() {
    this.outgoingInventoriesTransactionDto = await this.inventoryTransactionService.getOutgoingInventoriesNotAcceptByVendor(this.user.vendorId);
    this.inventoriesOutgoingNotAccepted = SharedFunction.checkUndefinedObjectValue(this.outgoingInventoriesTransactionDto) ? this.outgoingInventoriesTransactionDto.length : 0;
  }

  salesRight()
  {
    return this.user?.roleDescription != null ? this.user?.roleDescription?.toLocaleLowerCase() == 'sales' : true? false : false;
  }

  adminRight()
  {
    return this.user?.roleDescription != null ? this.user?.roleDescription?.toLocaleLowerCase() == 'admin' : true? false : false;
  }
  productionAdminRight()
  {
    return this.user?.roleDescription != null ? this.user?.roleDescription?.toLocaleLowerCase() == 'adminproduction' : true? false : false;
  }

  async createOrder()
  {
    this.goToPageNoParams('customer-list');
  }

  async acceptInventoryInVendor()
  {
    this.goToPageNoParams('accept-inventory');
  }

  async stockTaking()
  {
    this.goToPageNoParams('stock-taking');
  }

  async createNewCustomer()
  {
    this.goToPageNoParams('add-customer');
  }
}

