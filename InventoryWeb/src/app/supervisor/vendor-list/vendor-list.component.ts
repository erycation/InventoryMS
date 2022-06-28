import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { VendorDto } from 'src/app/model/Dtos/ms-inventory/vendorDto';
import { AccountService } from 'src/app/service/account.service';
import { VendorService } from 'src/app/service/ms-inventory/vendor.service';
import { DialogService } from 'src/app/shared/dialog/dialog.service';
import { ModalResetParams } from 'src/app/shared/modal-reset-params';
import { AddVendorComponent } from './add-vendor/add-vendor.component';

@Component({
  selector: 'app-vendor-list',
  templateUrl: './vendor-list.component.html',
  styleUrls: ['./vendor-list.component.css']
})
export class VendorListComponent extends ModalResetParams implements OnInit {

  vendorsDto: VendorDto[] = [];
  searchText: string = '';

  constructor(accountService: AccountService,
    router: Router,
    private dialogService : DialogService,
    private vendorService: VendorService) {
    super(accountService,
      router);
  }

  async ngOnInit() {
    await this.loadVendors();
  }

  async loadVendors()
  {
    this.vendorsDto = await this.vendorService.getVendorsManageInventories();
  }

  async addVendor()
  {
    await this.dialogService.openReturnModalService(AddVendorComponent, `Add Vendor`, null, () => { });
    await this.loadVendors();
  }

  async modifyVendor(vendorDto: VendorDto)
  {
    this.goToPageOneParams('modify-vendor',vendorDto.vendorId)
  }
}
