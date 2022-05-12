import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ExpectedInventoryDto } from 'src/app/model/Dtos/ms-inventory/expectedInventoryDto';
import { AccountService } from 'src/app/service/account.service';
import { ExpectedInventoryService } from 'src/app/service/ms-inventory/expected-inventory.service';
import { DialogService } from 'src/app/shared/dialog/dialog.service';
import { ModalResetParams } from 'src/app/shared/modal-reset-params';
import { CreateInventoryComponent } from './create-inventory/create-inventory.component';

@Component({
  selector: 'app-allocate',
  templateUrl: './allocate.component.html',
  styleUrls: ['./allocate.component.css']
})
export class AllocateComponent extends ModalResetParams implements OnInit {

  expectedInventoryDto: ExpectedInventoryDto[] = [];

  constructor(accountService: AccountService,
    router: Router,
    private dialogService : DialogService,
    private expectedInventoryService: ExpectedInventoryService) {
    super(accountService,
      router);
  }

  async ngOnInit() {
    await this.loadAllocatedExpectedInventoriesBySupervisor();
  }

  async loadAllocatedExpectedInventoriesBySupervisor()
  {
    this.expectedInventoryDto = await this.expectedInventoryService.getAllocatedExpectedInventoriesBySupervisor(this.user.username);
  }

  async allocateInventory()
  {
    await this.dialogService.openReturnModalService(CreateInventoryComponent, `Allocate Inventory`, null, () => { });
    await this.loadAllocatedExpectedInventoriesBySupervisor();
  }
}
