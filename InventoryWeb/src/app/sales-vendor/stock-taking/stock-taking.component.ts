import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { StockCountSheetReportDto } from 'src/app/model/Dtos/ms-inventory/stockCountSheetReportDto';
import { StockTakingDto } from 'src/app/model/Dtos/ms-inventory/stockTakingDto';
import { AccountService } from 'src/app/service/account.service';
import { ReconcilationReportReportService } from 'src/app/service/ms-inventory/reconcilation-report.service';
import { ReportService } from 'src/app/service/ms-inventory/report.service';
import { StockTakingService } from 'src/app/service/ms-inventory/stock-taking.service';
import { UserGenerateInvCertDto } from 'src/app/service/ms-inventory/userGenerateInvCertDto';
import { DialogService } from 'src/app/shared/dialog/dialog.service';
import { ModalResetParams } from 'src/app/shared/modal-reset-params';

@Component({
  selector: 'app-stock-taking',
  templateUrl: './stock-taking.component.html',
  styleUrls: ['./stock-taking.component.css']
})
export class StockTakingComponent extends ModalResetParams implements OnInit {

  stockTakingDto: StockTakingDto[] = [];
  userGenerateInvCertDto = {} as UserGenerateInvCertDto;
  closingDate : Date;

  constructor(accountService: AccountService,
    router: Router,
    private dialogService: DialogService,
    private stockTakingService: StockTakingService,
    private reconcilationReportReportService : ReconcilationReportReportService) {
    super(accountService,
      router);
  }

  async ngOnInit() {
    this.closingDate = new Date();
    await this.loadStockTaking();
  }

  async loadStockTaking()
  {
    this.stockTakingDto = await this.stockTakingService.getCurrentStockTakingByVendor(this.user.vendorId);
  }

  async confirmAndPrint()
  {

    this.userGenerateInvCertDto.vendorId = this.user.vendorId;
    this.userGenerateInvCertDto.generateById = this.user.userId;

    this.loading = true;
    this.reconcilationReportReportService.generateInventoryCertificate(this.userGenerateInvCertDto).subscribe(
      async data => {
        this.loading = false;
        this.dialogService.openSuccessModal(`Successfully`, data.message);
        await this.reconcilationReportReportService.downloadReconcilationReport(data.data.inventoryCertificateId, 'pdf');
        await this.loadStockTaking();
      },
      error => {
        this.loading = false;
        this.dialogService.openAlertModal(`Error`, error.error.message);
      });
  }
}

