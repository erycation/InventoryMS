import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { VendorDto } from 'src/app/model/Dtos/ms-inventory/vendorDto';
import { VendorInvoiceItemDto } from 'src/app/model/Dtos/ms-inventory/vendorInvoiceItemDto';
import { AccountService } from 'src/app/service/account.service';
import { VendorInvoiceReportService } from 'src/app/service/ms-inventory/vendor-Invoice-report.service';
import { VendorService } from 'src/app/service/ms-inventory/vendor.service';
import { DialogService } from 'src/app/shared/dialog/dialog.service';
import { ModalResetParams } from 'src/app/shared/modal-reset-params';
import { SharedFunction } from 'src/app/shared/shared-function';

@Component({
  selector: 'app-invoice-report',
  templateUrl: './invoice-report.component.html',
  styleUrls: ['./invoice-report.component.css']
})
export class InvoiceReportComponent extends ModalResetParams implements OnInit {

  startDate: Date;
  endDate: Date;
  vendorDto = {} as VendorDto;
  vendorsDto: VendorDto[] = [];
  vendorInvoiceItemsDto: VendorInvoiceItemDto[] = [];

  constructor(accountService: AccountService,
    router: Router,
    private dialogService: DialogService,
    private vendorService: VendorService,
    private vendorInvoiceReportService: VendorInvoiceReportService) {
    super(accountService,
      router);
  }

  async ngOnInit() {
    this.vendorsDto = await this.vendorService.getAllVendors();
  }

  async getInvoiceReports() {
    if (!SharedFunction.checkUndefinedObjectValue(this.vendorDto.vendorId)) {
      this.dialogService.openAlertModal(`Alert`, `Vendor required`);
      return;
    }
    else if (!SharedFunction.checkUndefinedObjectValue(this.startDate)) {
      this.dialogService.openAlertModal(`Alert`, `Startdate required`);
      return;
    } else if (!SharedFunction.checkUndefinedObjectValue(this.endDate)) {
      this.dialogService.openAlertModal(`Alert`, `Enddate required`);
      return;
    }
    else {
      const params: any = {
        startDate: this.startDate,
        endDate: this.endDate
      };

      this.vendorInvoiceItemsDto = await this.vendorInvoiceReportService.getVendorInvoiceByVendorId(this.vendorDto.vendorId, params);
      if(this.vendorInvoiceItemsDto.length == 0)
      {
        this.dialogService.openAlertModal(`Alert`, `No results found`);
      }
    }
  }

  async exportPdf(vendorInvoiceItemDto: VendorInvoiceItemDto) {
    await this.vendorInvoiceReportService.downloadVendorInvoiceReport(vendorInvoiceItemDto.invoiceNumber, `pdf`);
  }
}
