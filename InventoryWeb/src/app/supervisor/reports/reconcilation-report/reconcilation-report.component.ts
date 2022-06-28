import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { InventoryCertificateDto } from 'src/app/model/Dtos/ms-inventory/inventoryCertificateDto';
import { VendorDto } from 'src/app/model/Dtos/ms-inventory/vendorDto';
import { RequestHistoryInventoryCertificate } from 'src/app/model/request/ms-inventory/requestHistoryInventoryCertificate';
import { AccountService } from 'src/app/service/account.service';
import { InventoryCertificateService } from 'src/app/service/ms-inventory/Inventory-certificate.service';
import { VendorService } from 'src/app/service/ms-inventory/vendor.service';
import { ModalResetParams } from 'src/app/shared/modal-reset-params';
import { DatePipe } from '@angular/common';
import { SharedFunction } from 'src/app/shared/shared-function';
import { DialogService } from 'src/app/shared/dialog/dialog.service';
import { ReconcilationReportReportService } from 'src/app/service/ms-inventory/reconcilation-report.service';

@Component({
  selector: 'app-reconcilation-report',
  templateUrl: './reconcilation-report.component.html',
  styleUrls: ['./reconcilation-report.component.css']
})
export class ReconcilationReportComponent extends ModalResetParams implements OnInit {

  requestHistoryInventoryCertificate = {} as RequestHistoryInventoryCertificate;
  vendorsDto: VendorDto[] = [];
  inventoriesCertificateDto: InventoryCertificateDto[] = [];
  pipe = new DatePipe('en-US');
  dtInitial: string = "";
  dtFinal: string = "";

  constructor(accountService: AccountService,
    router: Router,
    private dialogService: DialogService,
    private vendorService: VendorService,
    private inventoryCertificateService: InventoryCertificateService,
    private reconcilationReportReportService: ReconcilationReportReportService) {
    super(accountService,
      router);
  }

  updateDateInitial() {
    let newDate = new Date();
    newDate.setDate(newDate.getDate() - 30)
    this.dtInitial = this.pipe.transform(newDate, "yyyy-MM-dd");
  }

  updateDateFinal() {
    let newDate = new Date(this.dtInitial);
    newDate.setDate(newDate.getDate() + 30)
    this.dtInitial = this.pipe.transform(newDate, "yyyy-MM-dd");
  }

  async ngOnInit() {

    let today: Date = new Date();
    let sevenDaysAgo = new Date();
    sevenDaysAgo.setDate(today.getDate() - 30)
    this.dtInitial = this.pipe.transform(sevenDaysAgo, "yyyy-MM-dd");
    this.dtFinal = this.pipe.transform(today, "yyyy-MM-dd");
    this.vendorsDto = await this.vendorService.getAllVendors();
  }

  async getInventoryCertificateHistory() {
    if (!SharedFunction.checkUndefinedObjectValue(this.requestHistoryInventoryCertificate.vendorId)) {
      this.dialogService.openAlertModal(`Alert`, `Vendor required`);
      return;
    }
    else if (!SharedFunction.checkUndefinedObjectValue(this.dtInitial)) {
      this.dialogService.openAlertModal(`Alert`, `Startdate required`);
      return;
    } else if (!SharedFunction.checkUndefinedObjectValue(this.dtFinal)) {
      this.dialogService.openAlertModal(`Alert`, `Enddate required`);
      return;
    }
    else {
      const params: any = {
        vendorId: this.requestHistoryInventoryCertificate.vendorId,
        startDate: this.dtInitial,
        endDate: this.dtFinal
      };

      this.inventoriesCertificateDto = await this.inventoryCertificateService.getHistoryInventoryCertificateByVendorId(params);
      if(this.inventoriesCertificateDto.length == 0)
      {
        this.dialogService.openAlertModal(`Alert`, `No results found`);
      }
    }
  }

  async exportPdf(inventoryCertificateId: string) {
    await this.reconcilationReportReportService.downloadReconcilationReport(inventoryCertificateId, `pdf`);
  }
}
