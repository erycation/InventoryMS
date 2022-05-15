import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { InventoryDto } from 'src/app/model/Dtos/ms-inventory/inventoryDto';
import { InventoryTransactionDto } from 'src/app/model/Dtos/ms-inventory/inventoryTransactionDto';
import { AccountService } from 'src/app/service/account.service';
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
  inventoriesDto: InventoryDto[] = [];

  constructor(accountService: AccountService,
    router: Router,
    private dialogService : DialogService,
    private inventoryService : InventoryService,
    private inventoryTransactionService: InventoryTransactionService) {
    super(accountService,
      router);
  }

  async ngOnInit() {
      this.inventoriesDto = await this.inventoryService.getAllInventories();
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
      
      this.inventoryTransactionService.captureTransactionInventoryInToProduction(this.inventoryTransactionDto).subscribe(
        data => {         
          this.dialogService.openSuccessModal(`Successfully`, data.message);
        },
        error => {        
         this.dialogService.openAlertModal(`Error`, error.error.message);       
        });
        
    }
  }
}
