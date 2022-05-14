import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { CustomerDto } from 'src/app/model/Dtos/ms-inventory/customerDto';
import { CustomerOrderItemToBePlacedDto } from 'src/app/model/Dtos/ms-inventory/customerOrderItemToBePlacedDto';
import { InventoryDto } from 'src/app/model/Dtos/ms-inventory/inventoryDto';
import { AccountService } from 'src/app/service/account.service';
import { CustomerService } from 'src/app/service/ms-inventory/customer.service';
import { InventoryTransactionService } from 'src/app/service/ms-inventory/inventory-transaction.service';
import { InventoryService } from 'src/app/service/ms-inventory/inventory.service';
import { DialogService } from 'src/app/shared/dialog/dialog.service';
import { ModalResetParams } from 'src/app/shared/modal-reset-params';
import { SharedFunction } from 'src/app/shared/shared-function';

@Component({
  selector: 'app-create-order',
  templateUrl: './create-order.component.html',
  styleUrls: ['./create-order.component.css']
})
export class CreateOrderComponent extends ModalResetParams implements OnInit {

  customerDto = {} as CustomerDto;
  inventoriesDto: InventoryDto[] = [];
  inventoryDto: InventoryDto;
  customerOrderToBePlacedItem = {} as CustomerOrderItemToBePlacedDto;
  customerOrdersToBePlacedItemsDto: CustomerOrderItemToBePlacedDto[] = [];

  constructor(accountService: AccountService,
    router: Router,
    private dialogService: DialogService,
    private route: ActivatedRoute,
    private customerService: CustomerService,
    private inventoryService: InventoryService,
    private inventoryTransactionService: InventoryTransactionService) {
    super(accountService,
      router);

  }

  async ngOnInit() {
    this.customerDto = await this.customerService.getCustomerById(this.route.snapshot.params.customerId);
    this.inventoriesDto = await this.inventoryService.getAllInventories();
    this.customerOrderToBePlacedItem.customerId = this.customerDto.customerId;
    this.customerOrderToBePlacedItem.processById = this.user.userId;
    this.customerOrderToBePlacedItem.locationVendorId = this.user.vendorId;
  }

  numberOnly(event: { which: any; keyCode: any; }): boolean {
    return SharedFunction.numberOnly(event);
  }

  addCustomerItemToOrder() {

    if (!SharedFunction.checkUndefinedObjectValue(this.customerOrderToBePlacedItem)) {
      this.dialogService.openAlertModal(`Alert`, `Inventory Item required`);
      return;
    } else {

      this.customerOrderToBePlacedItem.inventoryName = this.inventoryDto.productName;
      this.customerOrderToBePlacedItem.inventoryId = this.inventoryDto.inventoryId;
      this.customerOrderToBePlacedItem.customerId = this.customerDto.customerId;
      this.customerOrderToBePlacedItem.locationVendorId = this.user.vendorId;
      this.customerOrderToBePlacedItem.processById = this.user.userId;
      this.customerOrdersToBePlacedItemsDto.push(Object.assign({}, this.customerOrderToBePlacedItem));
    }
  }
  
  async removeItem(index: number) {
    this.customerOrdersToBePlacedItemsDto.splice(index, 1);
  }

  async checkoutInventory() {
  
    if (!SharedFunction.checkUndefinedObjectValue(this.customerOrdersToBePlacedItemsDto)) {
      this.dialogService.openAlertModal(`Alert`, `Select Items To Checkout`);
      return;
    } else {

      this.inventoryTransactionService.checkOutCustomerToCreateOrder(this.customerOrdersToBePlacedItemsDto).subscribe(
        data => {
          this.dialogService.openSuccessModal(`Successfully`, data.message);
        },
        error => {
          this.dialogService.openAlertModal(`Error`, error.error.message);
        });
    }
  }
}
