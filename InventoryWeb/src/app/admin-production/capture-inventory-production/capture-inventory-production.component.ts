import { Component, OnInit } from '@angular/core';
import { MatDialogRef } from '@angular/material/dialog';
import { Router } from '@angular/router';
import { InventoryBalanceDto } from 'src/app/model/Dtos/ms-inventory/inventoryBalanceDto';
import { InventoryTransactionDto } from 'src/app/model/Dtos/ms-inventory/inventoryTransactionDto';
import { AccountService } from 'src/app/service/account.service';
import { InventoryBalanceService } from 'src/app/service/ms-inventory/Inventory-balance.service';
import { InventoryTransactionService } from 'src/app/service/ms-inventory/inventory-transaction.service';
import { InventoryService } from 'src/app/service/ms-inventory/inventory.service';
import { DialogService } from 'src/app/shared/dialog/dialog.service';
import { ModalResetParams } from 'src/app/shared/modal-reset-params';
import { SharedFunction } from 'src/app/shared/shared-function';

@Component({
  selector: 'app-capture-inventory-production',
  templateUrl: './capture-inventory-production.component.html',
  styleUrls: ['./capture-inventory-production.component.css']
})
export class CaptureInventoryProductionComponent extends ModalResetParams implements OnInit {

  inventoryTransactionDto = {} as InventoryTransactionDto;
  inventoriesAtVendor: InventoryBalanceDto[] = [];

  constructor(public dialogRef: MatDialogRef<CaptureInventoryProductionComponent>,
    accountService: AccountService,
    router: Router,
    private dialogService : DialogService,
    private inventoryBalanceService: InventoryBalanceService,
    private inventoryTransactionService: InventoryTransactionService) {
    super(accountService,
      router);
  }

  async ngOnInit() {
      this.inventoriesAtVendor = await this.inventoryBalanceService.getOpeningInventoryByVendorId(this.user.vendorId);
  }

  async closeDialog() {
    this.dialogRef.close();
  }

  numberOnly(event: { which: any; keyCode: any; }): boolean {
    return SharedFunction.numberOnly(event);
  }

  captureInventory()
  {
    this.inventoryTransactionDto.locationVendorId = this.user.vendorId;
    this.inventoryTransactionDto.processById = this.user.userId;
    if (!SharedFunction.checkUndefinedObjectValue(this.inventoryTransactionDto.inventoryId)) {
      this.dialogService.openAlertModal(`Alert`,`Inventory required`);
      return;
    }else if (!SharedFunction.checkUndefinedObjectValue(this.inventoryTransactionDto.quantity)) {
      this.dialogService.openAlertModal(`Alert`,`Quantity required`);
      return;
    }
    else
    {
      this.loading = true;
      this.inventoryTransactionService.captureTransactionInventoryInToProduction(this.inventoryTransactionDto).subscribe(
        data => {   
          this.loading = false;     
          this.closeDialog(); 
          this.dialogService.openSuccessModal(`Successfully`, data.message);
        },
        error => { 
          this.loading = false;       
         this.dialogService.openAlertModal(`Error`, error.error.message);       
        });
        
    }
  }
}
