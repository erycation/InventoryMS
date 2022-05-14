import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { CustomerDto } from 'src/app/model/Dtos/ms-inventory/customerDto';
import { AccountService } from 'src/app/service/account.service';
import { CustomerService } from 'src/app/service/ms-inventory/customer.service';
import { DialogService } from 'src/app/shared/dialog/dialog.service';
import { ModalResetParams } from 'src/app/shared/modal-reset-params';
import { SharedFunction } from 'src/app/shared/shared-function';

@Component({
  selector: 'app-add-customer',
  templateUrl: './add-customer.component.html',
  styleUrls: ['./add-customer.component.css']
})
export class AddCustomerComponent extends ModalResetParams implements OnInit {

  customerDto = {} as CustomerDto;

  constructor(accountService: AccountService,
    router: Router,
    private dialogService : DialogService,
    private customerService: CustomerService) {
    super(accountService,
      router);

  }
  ngOnInit(): void {

  }

  async saveCustomer()
  {

    if (!SharedFunction.checkUndefinedObjectValue(this.customerDto.firstName)) {
      this.dialogService.openAlertModal(`Alert`,`Firstname required`);
      return;
    }else if (!SharedFunction.checkUndefinedObjectValue(this.customerDto.surname)) {
      this.dialogService.openAlertModal(`Alert`,`Surname required`);
      return;
    }else if (!SharedFunction.checkUndefinedObjectValue(this.customerDto.emailAddress)) {
      this.dialogService.openAlertModal(`Alert`,`Email Address required`);
      return;
    }else if (!SharedFunction.checkUndefinedObjectValue(this.customerDto.cellphoneNo)) {
      this.dialogService.openAlertModal(`Alert`,`Cellphone required`);
      return;
    }
    this.customerService.createCustomer(this.customerDto).subscribe(
      data => {         
        this.dialogService.openSuccessModal(`Successfully`, data.message);
      },
      error => {        
       this.dialogService.openAlertModal(`Error`, error.error.message);       
      });
  }
}

