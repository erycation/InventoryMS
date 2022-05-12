import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ExpectedInventoryDto } from 'src/app/model/Dtos/ms-inventory/expectedInventoryDto';
import { VendorDto } from 'src/app/model/Dtos/ms-inventory/vendorDto';
import { AccountService } from 'src/app/service/account.service';
import { ExpectedInventoryService } from 'src/app/service/ms-inventory/expected-inventory.service';
import { VendorService } from 'src/app/service/ms-inventory/vendor.service';
import { DialogService } from 'src/app/shared/dialog/dialog.service';
import { ModalResetParams } from 'src/app/shared/modal-reset-params';
import { SharedFunction } from 'src/app/shared/shared-function';

@Component({
  selector: 'app-send-to-vendor',
  templateUrl: './send-to-vendor.component.html',
  styleUrls: ['./send-to-vendor.component.css']
})
export class SendToVendorComponent extends ModalResetParams implements OnInit {

  expectedInventoryDto: ExpectedInventoryDto[] = [];
  countedExpectedInventoryDto: ExpectedInventoryDto[] = [];
  selectedExpectedInventoryDto: ExpectedInventoryDto[] = [];
  vendorsDto: VendorDto[] = [];
  vendorId : string
  countedItems : number = 0;

  constructor(accountService: AccountService,
    router: Router,
    private dialogService : DialogService,
    private vendorService : VendorService,
    private expectedInventoryService: ExpectedInventoryService) {
    super(accountService,
      router);
  }

  async ngOnInit() {
    this.vendorsDto = await this.vendorService.getAllVendors();
    await this.getNumberOfCountedInventoryToBeProcessed();
  }

  async getNumberOfCountedInventoryToBeProcessed()
  {
    this.expectedInventoryDto = await this.expectedInventoryService.getAllocatedExpectedInventoriesByAdmin(this.user.userId);
    this.resetCountedInventory();
    this.expectedInventoryDto.forEach(element => {
      if(element.counted)
          this.countedItems++;
    })
  }

  resetCountedInventory()
  {
    this.countedItems = 0;
  }

  async countInventory()
  {
    this.goToPageNoParams('count-inventory')
  }

  async searchInventoryToProcess()
  {
    if (!SharedFunction.checkUndefinedObjectValue(this.vendorId)) {
      this.dialogService.openAlertModal(`Alert`,`Vendor required`);
      return;
    }
    this.countedExpectedInventoryDto = await this.expectedInventoryService.getCountedExpectedInventoryByVendor(this.user.userId, this.vendorId)
  }

  addExpectedTransaction(expectedInventoryDto : ExpectedInventoryDto)
  {
    const index = this.selectedExpectedInventoryDto.findIndex(expectedTransaction => expectedTransaction.expectedInventoryId === expectedInventoryDto.expectedInventoryId);
    if(index == 0)
    {
      this.selectedExpectedInventoryDto.splice(index, 1);      
    }
    else{
      this.selectedExpectedInventoryDto.push(expectedInventoryDto);
    }
  }

  async sendInventoryToVendor()
  {
    if (!SharedFunction.checkUndefinedObjectValue(this.selectedExpectedInventoryDto)) {
      this.dialogService.openAlertModal(`Alert`,`Select Inventory`);
      return;
    }
    else if (this.selectedExpectedInventoryDto.length == 0) {
      this.dialogService.openAlertModal(`Alert`,`Select Inventory`);
      return;
    }else
    {
    this.expectedInventoryService.sendExpectedInventoryToVendor(this.selectedExpectedInventoryDto, this.user.vendorId).subscribe(
      data => {         
        this.dialogService.openSuccessModal(`Successfully`, data.message);
        this.searchInventoryToProcess();
        this.getNumberOfCountedInventoryToBeProcessed();
      },
      error => {        
       this.dialogService.openAlertModal(`Error`, error.error.message);       
      });
    }
  }
}
