import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { InventoryDto } from 'src/app/model/Dtos/ms-inventory/inventoryDto';
import { AccountService } from 'src/app/service/account.service';
import { InventoryService } from 'src/app/service/ms-inventory/inventory.service';
import { DialogService } from 'src/app/shared/dialog/dialog.service';
import { ModalResetParams } from 'src/app/shared/modal-reset-params';
import { AddInventoryComponent } from './add-inventory/add-inventory.component';
import { ModifyInventoryComponent } from './modify-inventory/modify-inventory.component';

@Component({
  selector: 'app-inventory-list',
  templateUrl: './inventory-list.component.html',
  styleUrls: ['./inventory-list.component.css']
})
export class InventoryListComponent extends ModalResetParams implements OnInit {

  inventoriesDto: InventoryDto[] = [];

  constructor(accountService: AccountService,
    router: Router,
    private dialogService : DialogService,
    private inventoryService: InventoryService) {
    super(accountService,
      router);
  }

  async ngOnInit() {
    await this.loadInventories();
  }

  async loadInventories()
  {
    this.inventoriesDto = await this.inventoryService.getAllInventories();
  }

  async addInventory()
  {
    await this.dialogService.openReturnModalService(AddInventoryComponent, `Add Inventory`, null, () => { });
    await this.loadInventories();
  }

  async goToEditInventory(inventoryDto: InventoryDto)
  {
    await this.dialogService.openReturnModalService(ModifyInventoryComponent, `Modify Inventory`, inventoryDto, () => { });
    await this.loadInventories();
  }
}