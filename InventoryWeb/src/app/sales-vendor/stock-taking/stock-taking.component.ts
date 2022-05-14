import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { StockCountSheetReportDto } from 'src/app/model/Dtos/ms-inventory/stockCountSheetReportDto';
import { AccountService } from 'src/app/service/account.service';
import { ReportService } from 'src/app/service/ms-inventory/report.service';
import { DialogService } from 'src/app/shared/dialog/dialog.service';
import { ModalResetParams } from 'src/app/shared/modal-reset-params';

@Component({
  selector: 'app-stock-taking',
  templateUrl: './stock-taking.component.html',
  styleUrls: ['./stock-taking.component.css']
})
export class StockTakingComponent extends ModalResetParams implements OnInit {

  stockCountSheetReportDto: StockCountSheetReportDto[] = [];

  constructor(accountService: AccountService,
    router: Router,
    private dialogService: DialogService,
    private reportService: ReportService) {
    super(accountService,
      router);
  }

  async ngOnInit() {
    await this.loadStockSheetReport();
  }

  async loadStockSheetReport()
  {
    this.stockCountSheetReportDto = await this.reportService.getStockCountSheetReportByLocation(this.user.vendorId);
  }

  async confirmAndPrint()
  {
    
  }
}

