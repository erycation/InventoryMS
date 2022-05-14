import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { CustomerDto } from 'src/app/model/Dtos/ms-inventory/customerDto';
import { AccountService } from 'src/app/service/account.service';
import { CustomerService } from 'src/app/service/ms-inventory/customer.service';
import { DialogService } from 'src/app/shared/dialog/dialog.service';
import { ModalResetParams } from 'src/app/shared/modal-reset-params';
import { SharedFunction } from 'src/app/shared/shared-function';
import { AddCustomerComponent } from './add-customer/add-customer.component';

@Component({
  selector: 'app-customer-list',
  templateUrl: './customer-list.component.html',
  styleUrls: ['./customer-list.component.css']
})
export class CustomerListComponent extends ModalResetParams implements OnInit {

  customersDto: CustomerDto[] = [];
  customerName: string;

  constructor(accountService: AccountService,
    router: Router,
    private dialogService : DialogService,
    private customerService: CustomerService) {
    super(accountService,
      router);
  }

  ngOnInit(): void {
  }

  async searchCustomers()
  {
    if (!SharedFunction.checkUndefinedObjectValue(this.customerName)) {
      this.dialogService.openAlertModal(`Alert`,`Customer Name required`);
      return;
    }
    this.customersDto = await this.customerService.searchCustomers(this.customerName)
  }

  async addCustomer()
  {
    await this.dialogService.openReturnModalService(AddCustomerComponent, `Add Customer`, null, () => { });
  }

  goToCreateOrderPage(customersDto: CustomerDto)
  {
    this.goToPageOneParams('create-order',customersDto.customerId)
//create-order:/customerId
  }
}
