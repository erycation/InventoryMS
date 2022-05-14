import { Component, Inject, OnInit } from '@angular/core';
import { MAT_DIALOG_DATA } from '@angular/material/dialog';
import { Router } from '@angular/router';
import { VendorDto } from 'src/app/model/Dtos/ms-inventory/vendorDto';
import { AccountService } from 'src/app/service/account.service';
import { VendorService } from 'src/app/service/ms-inventory/vendor.service';
import { DialogService } from 'src/app/shared/dialog/dialog.service';
import { ModalResetParams } from 'src/app/shared/modal-reset-params';
import { SharedFunction } from 'src/app/shared/shared-function';

@Component({
  selector: 'app-modify-vendor',
  templateUrl: './modify-vendor.component.html',
  styleUrls: ['./modify-vendor.component.css']
})
export class ModifyVendorComponent extends ModalResetParams implements OnInit {

  vendorDto = {} as VendorDto;

  constructor(accountService: AccountService,
    router: Router,
    @Inject(MAT_DIALOG_DATA) public data: any,
    private dialogService : DialogService,
    private vendorService : VendorService) {
    super(accountService,
      router);
      this.vendorDto = data.message;
  }

  async ngOnInit() {

  }

  updateVendor()
  {

    if (!SharedFunction.checkUndefinedObjectValue(this.vendorDto.vendorName)) {
      this.dialogService.openAlertModal(`Alert`,`Vendor required`);
      return;
    }
    else
    {
      this.vendorService.updateVendor(this.vendorDto).subscribe(
        data => {         
          this.dialogService.openSuccessModal(`Successfully`, data.message);
        },
        error => {        
         this.dialogService.openAlertModal(`Error`, error.error.message);       
        });
    }
  }
}
