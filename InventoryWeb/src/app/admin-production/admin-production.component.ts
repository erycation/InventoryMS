import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { InventoryTransactionDto } from '../model/Dtos/ms-inventory/inventoryTransactionDto';
import { AccountService } from '../service/account.service';
import { InventoryTransactionService } from '../service/ms-inventory/inventory-transaction.service';
import { DialogService } from '../shared/dialog/dialog.service';
import { ModalResetParams } from '../shared/modal-reset-params';
import { SharedFunction } from '../shared/shared-function';
import { CaptureInventoryProductionComponent } from './capture-inventory-production/capture-inventory-production.component';

@Component({
  selector: 'app-admin-production',
  templateUrl: './admin-production.component.html',
  styleUrls: ['./admin-production.component.css']
})
export class AdminProductionComponent extends ModalResetParams implements OnInit {

  inventoryTransactionDto: InventoryTransactionDto[] = [];
  selectedInventoryTransactionsDto: InventoryTransactionDto[] = [];

  constructor(accountService: AccountService,
    router: Router,
    private dialogService: DialogService,
    private inventoryTransactionService: InventoryTransactionService) {
    super(accountService,
      router);
  }

  async ngOnInit() {
    await this.loadUnverifiedInventoriesInToProduction();
  }

  async loadUnverifiedInventoriesInToProduction() {
    this.inventoryTransactionDto = await this.inventoryTransactionService.getUnverifiedInventoriesToAcceptByProduction(this.user.vendorId)
  }

  async captureInventory() {
    await this.dialogService.openReturnModalService(CaptureInventoryProductionComponent, `Capture Inventory`, null, () => { });
    await this.loadUnverifiedInventoriesInToProduction();
  }

  addInventoryTransactionToSend(inventoryTransaction: InventoryTransactionDto) {
    const index = this.selectedInventoryTransactionsDto.findIndex(transaction => transaction.inventoryTransactionId === inventoryTransaction.inventoryTransactionId);
    if (index == 0) {
      this.selectedInventoryTransactionsDto.splice(index, 1);
    }
    else {
      this.selectedInventoryTransactionsDto.push(inventoryTransaction);
    }
  }

  async sendInventoryToWareHouse() {
    if (!SharedFunction.checkUndefinedObjectValue(this.selectedInventoryTransactionsDto)) {
      this.dialogService.openAlertModal(`Alert`, `Select Inventory`);
      return;
    }
    else if (this.selectedInventoryTransactionsDto.length == 0) {
      this.dialogService.openAlertModal(`Alert`, `Select Inventory`);
      return;
    } else {
      this.inventoryTransactionService.verifyInventorySendToProduction(this.selectedInventoryTransactionsDto).subscribe(
        data => {
          this.dialogService.openSuccessModal(`Successfully`, data.message);
        },
        error => {
          this.dialogService.openAlertModal(`Error`, error.error.message);
        });
    }
  }
}
