import { Component, Inject, OnInit } from '@angular/core';
import { MAT_DIALOG_DATA } from '@angular/material/dialog';
import { Router } from '@angular/router';
import { InventoryCertificateDto } from 'src/app/model/Dtos/ms-inventory/inventoryCertificateDto';
import { StockCountSheetReportDto } from 'src/app/model/Dtos/ms-inventory/stockCountSheetReportDto';
import { AccountService } from 'src/app/service/account.service';
import { ReportService } from 'src/app/service/ms-inventory/report.service';
import { DialogService } from 'src/app/shared/dialog/dialog.service';
import { ModalResetParams } from 'src/app/shared/modal-reset-params';

@Component({
  selector: 'app-view-stock-taking',
  templateUrl: './view-stock-taking.component.html',
  styleUrls: ['./view-stock-taking.component.css']
})
export class ViewStockTakingComponent extends ModalResetParams implements OnInit {

  inventoryCertificateDto: InventoryCertificateDto
  stockCountSheetReportDto: StockCountSheetReportDto[] = [];
  
  constructor(accountService: AccountService,
    router: Router,
    @Inject(MAT_DIALOG_DATA) public data: any,
    private dialogService : DialogService,
    private reportService: ReportService) {
    super(accountService,
      router);
      this.inventoryCertificateDto = data.message;
  }

  async ngOnInit() {
    this.stockCountSheetReportDto = await this.reportService.getExistingStockCountSheetReportByLocation(this.inventoryCertificateDto.inventoryCertificateId,this.inventoryCertificateDto.vendorId);
  }

}


