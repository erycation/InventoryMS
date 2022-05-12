import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { InventoryTransactionDto } from '../model/Dtos/ms-inventory/inventoryTransactionDto';
import { AccountService } from '../service/account.service';
import { InventoryTransactionService } from '../service/ms-inventory/inventory-transaction.service';
import { DialogService } from '../shared/dialog/dialog.service';
import { ModalResetParams } from '../shared/modal-reset-params';
import { SharedFunction } from '../shared/shared-function';

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css']
})
export class DashboardComponent extends ModalResetParams implements OnInit {

  inventoriesAwaitingForAccepted: number = 0;
  inventoriesOutgoingNotAccepted: number = 0;
  inventoriesTransactionDto: InventoryTransactionDto[] = [];
  outgoingInventoriesTransactionDto: InventoryTransactionDto[] = [];

  constructor(accountService: AccountService,
    router: Router,
    private dialogService: DialogService,
    private inventoryTransactionService: InventoryTransactionService) {
    super(accountService,
      router);
  }

  async ngOnInit() {
    await this.loadInventoriesToAccepted();
    await this.loadOutgoingInventoriesNoTAccepted();
  }

  async loadInventoriesToAccepted() {
    this.inventoriesTransactionDto = await this.inventoryTransactionService.getInventoriesAwaitingToAcceptByVendor(this.user.vendorId);
    this.inventoriesAwaitingForAccepted = SharedFunction.checkUndefinedObjectValue(this.inventoriesTransactionDto) ? this.inventoriesTransactionDto.length : 0;
  }

  async loadOutgoingInventoriesNoTAccepted() {
    this.outgoingInventoriesTransactionDto = await this.inventoryTransactionService.getOutgoingInventoriesNotAcceptByVendor(this.user.vendorId);
    this.inventoriesOutgoingNotAccepted = SharedFunction.checkUndefinedObjectValue(this.outgoingInventoriesTransactionDto) ? this.outgoingInventoriesTransactionDto.length : 0;
  }
}

