import { Component, Inject, OnInit } from '@angular/core';
import { MAT_DIALOG_DATA } from '@angular/material/dialog';
import { Router } from '@angular/router';
import { InventoryTransactionDto } from 'src/app/model/Dtos/ms-inventory/inventoryTransactionDto';
import { AccountService } from 'src/app/service/account.service';
import { InventoryTransactionService } from 'src/app/service/ms-inventory/inventory-transaction.service';
import { UserService } from 'src/app/service/ms-inventory/user.service';
import { DialogService } from 'src/app/shared/dialog/dialog.service';
import { ModalResetParams } from 'src/app/shared/modal-reset-params';
import { SharedFunction } from 'src/app/shared/shared-function';

@Component({
  selector: 'app-accept-inventory',
  templateUrl: './accept-inventory.component.html',
  styleUrls: ['./accept-inventory.component.css']
})
export class AcceptInventoryComponent extends ModalResetParams implements OnInit {

  inventoryTransactionDto: InventoryTransactionDto[] = [];
  acceptedTransactionDto: InventoryTransactionDto[] = [];

  constructor(accountService: AccountService,
    router: Router,
    @Inject(MAT_DIALOG_DATA) public data: any,
    private dialogService : DialogService,
    private userService : UserService,
    private inventoryTransactionService: InventoryTransactionService) {
    super(accountService,
      router);
      this.inventoryTransactionDto = data.message;
  }

  async ngOnInit() {

  }

  async selectToAcceptInventoryTransaction(inventoryTransactionDto : InventoryTransactionDto)
  {
    const index = this.acceptedTransactionDto.findIndex(inventoryTransaction => inventoryTransaction.inventoryTransactionId === inventoryTransactionDto.inventoryTransactionId);
    if(index == 0)
    {
      this.acceptedTransactionDto.splice(index, 1);      
    }
    else{
      this.acceptedTransactionDto.push(inventoryTransactionDto);
    }
  }

  async acceptInventoyryInVendor()
  {
    if (!SharedFunction.checkUndefinedObjectValue(this.acceptedTransactionDto)) {
      this.dialogService.openAlertModal(`Alert`,`Select Inventory`);
      return;
    }
    else if (this.acceptedTransactionDto.length == 0) {
      this.dialogService.openAlertModal(`Alert`,`Select Inventory`);
      return;
    }else
    {
      
        this.inventoryTransactionService.acceptTransactionInventoryInToVendor(this.acceptedTransactionDto, this.user.vendorId, this.user.userId).subscribe(
          data => {         
            this.dialogService.openSuccessModal(`Successfully`, data.message);
          },
          error => {        
          this.dialogService.openAlertModal(`Error`, error.error.message);       
          });
    }
  }
}
