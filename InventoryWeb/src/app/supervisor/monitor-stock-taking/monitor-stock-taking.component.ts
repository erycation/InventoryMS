import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { InventoryCertificateDto } from 'src/app/model/Dtos/ms-inventory/inventoryCertificateDto';
import { VendorDto } from 'src/app/model/Dtos/ms-inventory/vendorDto';
import { AccountService } from 'src/app/service/account.service';
import { InventoryCertificateService } from 'src/app/service/ms-inventory/Inventory-certificate.service';
import { VendorService } from 'src/app/service/ms-inventory/vendor.service';
import { DialogService } from 'src/app/shared/dialog/dialog.service';
import { ModalResetParams } from 'src/app/shared/modal-reset-params';
import { SharedFunction } from 'src/app/shared/shared-function';
import { ViewStockTakingComponent } from './view-stock-taking/view-stock-taking.component';

@Component({
  selector: 'app-monitor-stock-taking',
  templateUrl: './monitor-stock-taking.component.html',
  styleUrls: ['./monitor-stock-taking.component.css']
})
export class MonitorStockTakingComponent extends ModalResetParams implements OnInit {

  inventoryCertificatesDto: InventoryCertificateDto[] = [];
  vendorsDto: VendorDto[] =[];
  vendorId : string;

  constructor(accountService: AccountService,
    router: Router,
    private dialogService: DialogService,
    private inventoryCertificateService: InventoryCertificateService,
    private vendorService: VendorService) {
    super(accountService,
      router);
  }

  async ngOnInit() {
    this.vendorsDto = await this.vendorService.getAllVendors();
  }

  async searchInventoryCertificateByVendorId()
  {
    if (!SharedFunction.checkUndefinedObjectValue(this.vendorId)) {
      this.dialogService.openAlertModal(`Alert`,`Vendor required`);
      return;
    }
    this.inventoryCertificatesDto = await this.inventoryCertificateService.getAllInventoryCertificateByVendorId(this.vendorId);
  }

  async viewInventoryCertificate(inventoryCertificateDto: InventoryCertificateDto)
  {
    await this.dialogService.openReturnModalService(ViewStockTakingComponent, `View Stock Taking`, inventoryCertificateDto, () => { });
  }
}


