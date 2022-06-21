import { Component, Inject, OnInit } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { Router } from '@angular/router';
import { InventoryBalanceDto } from 'src/app/model/Dtos/ms-inventory/inventoryBalanceDto';
import { InventoryDto } from 'src/app/model/Dtos/ms-inventory/inventoryDto';
import { AccountService } from 'src/app/service/account.service';
import { InventoryBalanceService } from 'src/app/service/ms-inventory/Inventory-balance.service';
import { InventoryService } from 'src/app/service/ms-inventory/inventory.service';
import { DialogService } from 'src/app/shared/dialog/dialog.service';
import { ModalResetParams } from 'src/app/shared/modal-reset-params';
import { SharedFunction } from 'src/app/shared/shared-function';

@Component({
  selector: 'app-link-inventory-to-vendor',
  templateUrl: './link-inventory-to-vendor.component.html',
  styleUrls: ['./link-inventory-to-vendor.component.css']
})
export class LinkInventoryToVendorComponent extends ModalResetParams implements OnInit {

  inventoryBalanceDto = {} as InventoryBalanceDto;
  inventoriesDto: InventoryDto[] = [];
  vendorId: string;

  constructor( public dialogRef: MatDialogRef<LinkInventoryToVendorComponent>,
    accountService: AccountService,
    router: Router,
    private dialogService : DialogService,
    private inventoryService: InventoryService,
    private inventoryBalanceService: InventoryBalanceService,
    @Inject(MAT_DIALOG_DATA) public data: any,) {
    super(accountService,
      router);
      this.vendorId = data.message;
  }

  async ngOnInit() {
    this.inventoriesDto = await this.inventoryService.getAllInventories();
  }

  async closeDialog()
  {
    this.dialogRef.close();
  }

  async saveInventoryToVendor()
  {
    
    if (!SharedFunction.checkUndefinedObjectValue(this.inventoryBalanceDto.inventoryId)) {
      this.dialogService.openAlertModal(`Alert`,`Inventory required`);
      return;
    }
    else
    {
      this.inventoryBalanceDto.quantity = 0;
      this.inventoryBalanceService.createInventoryBalance(this.vendorId, this.inventoryBalanceDto).subscribe(
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
