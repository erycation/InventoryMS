import { Component, Inject, OnInit } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { Router } from '@angular/router';
import { ExpectedInventoryDto } from 'src/app/model/Dtos/ms-inventory/expectedInventoryDto';
import { AccountService } from 'src/app/service/account.service';
import { ExpectedInventoryService } from 'src/app/service/ms-inventory/expected-inventory.service';
import { DialogService } from 'src/app/shared/dialog/dialog.service';
import { ModalResetParams } from 'src/app/shared/modal-reset-params';
import { SharedFunction } from 'src/app/shared/shared-function';

@Component({
  selector: 'app-start-count-inventory',
  templateUrl: './start-count-inventory.component.html',
  styleUrls: ['./start-count-inventory.component.css']
})
export class StartCountInventoryComponent extends ModalResetParams implements OnInit {

  expectedInventoryDto = {} as ExpectedInventoryDto;
  variance : number = 0;
  constructor(public dialogRef: MatDialogRef<StartCountInventoryComponent>,
    accountService: AccountService,
    router: Router,
    @Inject(MAT_DIALOG_DATA) public data: any,
    private dialogService : DialogService,
    private expectedInventoryService: ExpectedInventoryService) {
    super(accountService,
      router);
      this.expectedInventoryDto = data.message;
      this.variance = this.expectedInventoryDto.quantity-this.expectedInventoryDto.count1;
  }

  ngOnInit(): void {
  }

  async closeDialog()
  {
    this.dialogRef.close();
  }

  numberOnly(event: { which: any; keyCode: any; }): boolean {
    return SharedFunction.numberOnly(event);
  }

  async countAllocateInventory()
  {

    if (!SharedFunction.checkUndefinedObjectValue(this.expectedInventoryDto.count1)) {
      this.dialogService.openAlertModal(`Alert`,`Count1 required`);
      return;
    }else if (Number(this.expectedInventoryDto.quantity) != Number(this.expectedInventoryDto.count1) && !SharedFunction.checkUndefinedObjectValue(this.expectedInventoryDto.varianceReason)) {
      this.dialogService.openAlertModal(`Alert`,`Variance Reason required`);
      return;
    }

    this.expectedInventoryService.countExpectedInventory(this.expectedInventoryDto).subscribe(
      data => {         
        this.dialogService.openSuccessModal(`Successfully`, data.message);
        this.closeDialog();   
      },
      error => {        
       this.dialogService.openAlertModal(`Error`, error.error.message);       
      });
  }

  calculateVariance()
  {
    this.variance = this.expectedInventoryDto.quantity-this.expectedInventoryDto.count1;
  }
}
