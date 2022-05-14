import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { VendorDto } from 'src/app/model/Dtos/ms-inventory/vendorDto';
import { AccountService } from 'src/app/service/account.service';
import { VendorService } from 'src/app/service/ms-inventory/vendor.service';
import { DialogService } from 'src/app/shared/dialog/dialog.service';
import { ModalResetParams } from 'src/app/shared/modal-reset-params';
import { SharedFunction } from 'src/app/shared/shared-function';

@Component({
  selector: 'app-add-vendor',
  templateUrl: './add-vendor.component.html',
  styleUrls: ['./add-vendor.component.css']
})
export class AddVendorComponent extends ModalResetParams implements OnInit {

  vendorDto = {} as VendorDto;

  constructor(accountService: AccountService,
    router: Router,
    private dialogService : DialogService,
    private vendorService : VendorService) {
    super(accountService,
      router);
  }

  async ngOnInit() {

  }


  saveVendor()
  {

    if (!SharedFunction.checkUndefinedObjectValue(this.vendorDto.vendorName)) {
      this.dialogService.openAlertModal(`Alert`,`Vendor required`);
      return;
    }
    else
    {
      this.vendorService.createVendor(this.vendorDto).subscribe(
        data => {         
          this.dialogService.openSuccessModal(`Successfully`, data.message);
        },
        error => {        
         this.dialogService.openAlertModal(`Error`, error.error.message);       
        });
    }
  }
}
