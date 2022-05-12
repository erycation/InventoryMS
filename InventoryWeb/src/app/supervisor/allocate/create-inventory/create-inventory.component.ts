import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ExpectedInventoryDto } from 'src/app/model/Dtos/ms-inventory/expectedInventoryDto';
import { InventoryDto } from 'src/app/model/Dtos/ms-inventory/inventoryDto';
import { UserDto } from 'src/app/model/Dtos/ms-inventory/userDto';
import { VendorDto } from 'src/app/model/Dtos/ms-inventory/vendorDto';
import { AccountService } from 'src/app/service/account.service';
import { ExpectedInventoryService } from 'src/app/service/ms-inventory/expected-inventory.service';
import { InventoryService } from 'src/app/service/ms-inventory/inventory.service';
import { UserService } from 'src/app/service/ms-inventory/user.service';
import { VendorService } from 'src/app/service/ms-inventory/vendor.service';
import { DialogService } from 'src/app/shared/dialog/dialog.service';
import { ModalResetParams } from 'src/app/shared/modal-reset-params';
import { SharedFunction } from 'src/app/shared/shared-function';

@Component({
  selector: 'app-create-inventory',
  templateUrl: './create-inventory.component.html',
  styleUrls: ['./create-inventory.component.css']
})
export class CreateInventoryComponent extends ModalResetParams implements OnInit {

  expectedInventoryDto = {} as ExpectedInventoryDto;
  usersDto: UserDto[] = [];
  vendorsDto: VendorDto[] = [];
  inventoriesDto: InventoryDto[] = [];

  constructor(accountService: AccountService,
    router: Router,
    private dialogService : DialogService,
    private userService : UserService,
    private vendorService : VendorService,
    private inventoryService : InventoryService,
    private expectedInventoryService: ExpectedInventoryService) {
    super(accountService,
      router);
  }

  async ngOnInit() {
      this.usersDto = await this.userService.getAdminUsers();
      this.vendorsDto = await this.vendorService.getAllVendors();
      this.inventoriesDto = await this.inventoryService.getAllInventories();
  }

  numberOnly(event: { which: any; keyCode: any; }): boolean {
    return SharedFunction.numberOnly(event);
  }

  saveAndAllocateInventory()
  {
    this.expectedInventoryDto.supervisor = this.user.username;
    if (!SharedFunction.checkUndefinedObjectValue(this.expectedInventoryDto.vendorId)) {
      this.dialogService.openAlertModal(`Alert`,`Vendor required`);
      return;
    }else if (!SharedFunction.checkUndefinedObjectValue(this.expectedInventoryDto.adminId)) {
      this.dialogService.openAlertModal(`Alert`,`Admin required`);
      return;
    }else if (!SharedFunction.checkUndefinedObjectValue(this.expectedInventoryDto.inventoryId)) {
      this.dialogService.openAlertModal(`Alert`,`Inventory required`);
      return;
    }else if (!SharedFunction.checkUndefinedObjectValue(this.expectedInventoryDto.quantity)) {
      this.dialogService.openAlertModal(`Alert`,`Quantity required`);
      return;
    }
    else
    {
      this.expectedInventoryService.createAndAllocateExpectedInventory(this.expectedInventoryDto).subscribe(
        data => {         
          this.dialogService.openSuccessModal(`Successfully`, data.message);
        },
        error => {        
         this.dialogService.openAlertModal(`Error`, error.error.message);       
        });
    }
  }
}
