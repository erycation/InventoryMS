import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AccountService } from 'src/app/service/account.service';
import { ModalResetParams } from 'src/app/shared/modal-reset-params';

@Component({
  selector: 'app-reports',
  templateUrl: './reports.component.html',
  styleUrls: ['./reports.component.css']
})
export class ReportsComponent extends ModalResetParams implements OnInit {

  constructor(accountService: AccountService,
    router: Router) {
    super(accountService,
      router);
  }

  ngOnInit(): void {
  }

  async goToReportPage(pageName: string)
  {
    this.goToPageNoParams(pageName)
  }
}
