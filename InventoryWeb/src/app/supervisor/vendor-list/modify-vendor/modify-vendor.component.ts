import { Component, Inject, OnInit } from '@angular/core';
import { MAT_DIALOG_DATA } from '@angular/material/dialog';
import { ActivatedRoute, Router } from '@angular/router';
import { InventoryBalanceDto } from 'src/app/model/Dtos/ms-inventory/inventoryBalanceDto';
import { InventoryDto } from 'src/app/model/Dtos/ms-inventory/inventoryDto';
import { VendorDto } from 'src/app/model/Dtos/ms-inventory/vendorDto';
import { AccountService } from 'src/app/service/account.service';
import { InventoryBalanceService } from 'src/app/service/ms-inventory/Inventory-balance.service';
import { InventoryService } from 'src/app/service/ms-inventory/inventory.service';
import { VendorService } from 'src/app/service/ms-inventory/vendor.service';
import { DialogService } from 'src/app/shared/dialog/dialog.service';
import { ModalResetParams } from 'src/app/shared/modal-reset-params';
import { SharedFunction } from 'src/app/shared/shared-function';
import { LinkInventoryToVendorComponent } from './link-inventory-to-vendor/link-inventory-to-vendor.component';

@Component({
  selector: 'app-modify-vendor',
  templateUrl: './modify-vendor.component.html',
  styleUrls: ['./modify-vendor.component.css']
})
export class ModifyVendorComponent extends ModalResetParams implements OnInit {

  inventoryId: string;
  vendorDto = {} as VendorDto;
  inventoryBalanceDto = {} as InventoryBalanceDto;
  inventoriesDto: InventoryDto[] = [];
  inventoriesLinkedVendor: InventoryBalanceDto[] = [];

  constructor(accountService: AccountService,
    router: Router,
    private route: ActivatedRoute,
    private dialogService : DialogService,
    private vendorService : VendorService,
    private inventoryService: InventoryService,
    private inventoryBalanceService: InventoryBalanceService) {
    super(accountService,
      router);      
  }

  async ngOnInit() {
    this.vendorDto = await this.vendorService.getVendorById(this.route.snapshot.params.vendorId);
    await this.getInventories();
    await this.getOpeningInventories();
  }

  async getInventories()
  {
    this.inventoriesDto = await this.inventoryService.getAllInventories();
  }

  async getOpeningInventories()
  {
    this.inventoriesLinkedVendor = await this.inventoryBalanceService.getOpeningInventoryByVendorId(this.route.snapshot.params.vendorId);
  }

  numberOnly(event: { which: any; keyCode: any; }): boolean {
    return SharedFunction.numberOnly(event);
  }

  async addOpeningInventory()
  {
    await this.dialogService.openReturnModalService(LinkInventoryToVendorComponent, `Add Inventories`, this.route.snapshot.params.vendorId, () => { });
    await this.getOpeningInventories();
  }

  async listVendors()
  {
    this.goToPageNoParams('vendor-list')
  }

  updateVendor()
  {
    if (!SharedFunction.checkUndefinedObjectValue(this.vendorDto.vendorName)) {
      this.dialogService.openAlertModal(`Alert`,`Vendor required`);
      return;
    }
    else
    {
      this.vendorService.updateVendor(this.vendorDto).subscribe(
        data => {         
          this.dialogService.openSuccessModal(`Successfully`, data.message);
        },
        error => {        
         this.dialogService.openAlertModal(`Error`, error.error.message);       
        });
    }
  }
}
