import { Component, Inject, OnInit } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { Router } from '@angular/router';
import { printOrderSlipDto } from 'src/app/model/Dtos/ms-inventory/printOrderSlipDto';
import { AccountService } from 'src/app/service/account.service';
import { InventoryTransactionService } from 'src/app/service/ms-inventory/inventory-transaction.service';
import { DialogService } from 'src/app/shared/dialog/dialog.service';
import { ModalResetParams } from 'src/app/shared/modal-reset-params';

@Component({
  selector: 'app-print-receipt',
  templateUrl: './print-receipt.component.html',
  styleUrls: ['./print-receipt.component.css']
})
export class PrintReceiptComponent extends ModalResetParams implements OnInit {

  printOrderSlipDto = {} as printOrderSlipDto;
  dateOrder: Date;

  constructor(public dialogRef: MatDialogRef<PrintReceiptComponent>,
    accountService: AccountService,
    router: Router,
    @Inject(MAT_DIALOG_DATA) public data: any,
    private dialogService : DialogService,
    private inventoryTransactionService: InventoryTransactionService) {
    super(accountService,
      router);
      this.printOrderSlipDto = data.message;
  }

  async ngOnInit() {
    this.dateOrder = new Date();
  }

  async closeDialog()
  {
    this.dialogRef.close();
  }

  async confirmOrderPrintReceipt()
  {
    this.loading = true;
    this.inventoryTransactionService.checkOutCustomerToCreateOrder(this.printOrderSlipDto.customerOrderItemToBePlacedDto).subscribe(
      data => {     
        this.closeDialog();
        this.loading = false;    
        this.dialogService.openSuccessModal(`Successfully`, data.message);
        this.goToPageNoParams('');
      },
      error => {  
        this.loading = false;      
        this.dialogService.openAlertModal(`Error`, error.error.message);       
      });
  }
}
