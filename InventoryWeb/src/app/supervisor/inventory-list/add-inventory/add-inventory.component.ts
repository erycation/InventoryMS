import { Component, OnInit } from '@angular/core';
import { MatDialogRef } from '@angular/material/dialog';
import { Router } from '@angular/router';
import { InventoryDto } from 'src/app/model/Dtos/ms-inventory/inventoryDto';
import { AccountService } from 'src/app/service/account.service';
import { InventoryService } from 'src/app/service/ms-inventory/inventory.service';
import { DialogService } from 'src/app/shared/dialog/dialog.service';
import { ModalResetParams } from 'src/app/shared/modal-reset-params';
import { SharedFunction } from 'src/app/shared/shared-function';

@Component({
  selector: 'app-add-inventory',
  templateUrl: './add-inventory.component.html',
  styleUrls: ['./add-inventory.component.css']
})
export class AddInventoryComponent extends ModalResetParams implements OnInit {

  inventoryDto = {} as InventoryDto;

  constructor( public dialogRef: MatDialogRef<AddInventoryComponent>,
    accountService: AccountService,
    router: Router,
    private dialogService : DialogService,
    private inventoryService : InventoryService) {
    super(accountService,
      router);
  }

  async ngOnInit() {

  }

  async closeDialog()
  {
    this.dialogRef.close();
  }
  
  saveInventory()
  {

    if (!SharedFunction.checkUndefinedObjectValue(this.inventoryDto.productName)) {
      this.dialogService.openAlertModal(`Alert`,`Inventory Name required`);
      return;
    }
    else  if (!SharedFunction.checkUndefinedObjectValue(this.inventoryDto.price)) {
      this.dialogService.openAlertModal(`Alert`,`Inventory Price required`);
      return;
    }
    else
    {
      this.inventoryService.createInventory(this.inventoryDto).subscribe(
        data => {         
          this.dialogService.openSuccessModal(`Successfully`, data.message);
          this.closeDialog();          
        },
        error => {        
         this.dialogService.openAlertModal(`Error`, error.error.message);       
        });
    }
  }
}
