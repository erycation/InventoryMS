import { Component, Inject, OnInit } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { Router } from '@angular/router';
import { InventoryDto } from 'src/app/model/Dtos/ms-inventory/inventoryDto';
import { AccountService } from 'src/app/service/account.service';
import { InventoryService } from 'src/app/service/ms-inventory/inventory.service';
import { DialogService } from 'src/app/shared/dialog/dialog.service';
import { ModalResetParams } from 'src/app/shared/modal-reset-params';
import { SharedFunction } from 'src/app/shared/shared-function';

@Component({
  selector: 'app-modify-inventory',
  templateUrl: './modify-inventory.component.html',
  styleUrls: ['./modify-inventory.component.css']
})
export class ModifyInventoryComponent extends ModalResetParams implements OnInit {

  inventoryDto = {} as InventoryDto;

  constructor( @Inject(MAT_DIALOG_DATA) public data: any,
    public dialogRef: MatDialogRef<ModifyInventoryComponent>,
    accountService: AccountService,
    router: Router,
    private dialogService : DialogService,
    private inventoryService : InventoryService) {
    super(accountService,
      router);
      this.inventoryDto = data.message;
  }

  async ngOnInit() {

  }

  async closeDialog()
  {
    this.dialogRef.close();
  }
  
  updateInventory()
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
      this.loading = true;
      this.inventoryService.updateInventory(this.inventoryDto).subscribe(
        data => {       
          this.loading = false;  
          this.dialogService.openSuccessModal(`Successfully`, data.message);
          this.closeDialog();          
        },
        error => {   
          this.loading = false;       
          this.dialogService.openAlertModal(`Error`, error.error.message);       
        });
    }
  }
}
