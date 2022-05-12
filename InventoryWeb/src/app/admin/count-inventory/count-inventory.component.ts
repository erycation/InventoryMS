import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ExpectedInventoryDto } from 'src/app/model/Dtos/ms-inventory/expectedInventoryDto';
import { AccountService } from 'src/app/service/account.service';
import { ExpectedInventoryService } from 'src/app/service/ms-inventory/expected-inventory.service';
import { DialogService } from 'src/app/shared/dialog/dialog.service';
import { ModalResetParams } from 'src/app/shared/modal-reset-params';
import { StartCountInventoryComponent } from './start-count-inventory/start-count-inventory.component';

@Component({
  selector: 'app-count-inventory',
  templateUrl: './count-inventory.component.html',
  styleUrls: ['./count-inventory.component.css']
})
export class CountInventoryComponent extends ModalResetParams implements OnInit {

  expectedInventoryDto: ExpectedInventoryDto[] = [];
  countedItems : number = 0;

  constructor(accountService: AccountService,
    router: Router,
    private dialogService : DialogService,
    private expectedInventoryService: ExpectedInventoryService) {
    super(accountService,
      router);
  }

  async ngOnInit() {
    await this.loadAllocatedInventories();
  }

  async loadAllocatedInventories()
  {
    this.expectedInventoryDto = await this.expectedInventoryService.getAllocatedExpectedInventoriesByAdmin(this.user.userId);
    this.resetCountedInventory();
    this.expectedInventoryDto.forEach(element => {
      if(element.counted)
          this.countedItems++;
    })
  }

  resetCountedInventory()
  {
    this.countedItems = 0;
  }

  async startCountInventory(expectedInventoryDto: ExpectedInventoryDto)
  {
    await this.dialogService.openReturnModalService(StartCountInventoryComponent, `Count Inventory`, expectedInventoryDto, () => { });
    await this.loadAllocatedInventories();
  }

  async sendInventoryToVendor()
  {
    this.goToPageNoParams('send-inventory-vendor')
  }
}

