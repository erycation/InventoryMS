import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { CustomerDto } from 'src/app/model/Dtos/ms-inventory/customerDto';
import { CustomerOrderItemToBePlacedDto } from 'src/app/model/Dtos/ms-inventory/customerOrderItemToBePlacedDto';
import { InventoryDto } from 'src/app/model/Dtos/ms-inventory/inventoryDto';
import { InventoryInStockDto } from 'src/app/model/Dtos/ms-inventory/inventoryInStockDto';
import { printOrderSlipDto } from 'src/app/model/Dtos/ms-inventory/printOrderSlipDto';
import { AccountService } from 'src/app/service/account.service';
import { CustomerService } from 'src/app/service/ms-inventory/customer.service';
import { InventoryInStockService } from 'src/app/service/ms-inventory/inventory-in-stock.service';
import { InventoryTransactionService } from 'src/app/service/ms-inventory/inventory-transaction.service';
import { InventoryService } from 'src/app/service/ms-inventory/inventory.service';
import { DialogService } from 'src/app/shared/dialog/dialog.service';
import { ModalResetParams } from 'src/app/shared/modal-reset-params';
import { SharedFunction } from 'src/app/shared/shared-function';
import { PrintReceiptComponent } from './print-receipt/print-receipt.component';

@Component({
  selector: 'app-create-order',
  templateUrl: './create-order.component.html',
  styleUrls: ['./create-order.component.css']
})
export class CreateOrderComponent extends ModalResetParams implements OnInit {

  customerDto = {} as CustomerDto;
  inventoriesInStockDto: InventoryInStockDto[] = [];
  inventoriesInStockAddedToCart: InventoryInStockDto[] = [];
  inventoriesAddedShoppingCart: InventoryInStockDto[] = [];
  totalOrderPrice: number = 0;
  totalQuantityToOrder: number = 0;
  //customerOrderItemToBePlacedDto: CustomerOrderItemToBePlacedDto[] = [];
  printOrderSlipDto = {} as printOrderSlipDto;

  inventoriesDto: InventoryDto[] = [];
  inventoryDto: InventoryDto;
  customerOrderToBePlacedItem = {} as CustomerOrderItemToBePlacedDto;
  customerOrdersToBePlacedItemsDto: CustomerOrderItemToBePlacedDto[] = [];

  constructor(accountService: AccountService,
    router: Router,
    private dialogService: DialogService,
    private route: ActivatedRoute,
    private customerService: CustomerService,
    private inventoryInStockService: InventoryInStockService,


    private inventoryService: InventoryService,
    private inventoryTransactionService: InventoryTransactionService) {
    super(accountService,
      router);

  }

  async ngOnInit() {
    this.customerDto = await this.customerService.getCustomerById(this.route.snapshot.params.customerId);
    this.inventoriesInStockDto = await this.loadInventoriesInStock();
  }

  async loadInventoriesInStock() {
    return await this.inventoryInStockService.getInventoriesInStockByVendorId(this.user.vendorId);
  }

  addQuantityToCart(inventoryInStockDto: InventoryInStockDto) {

    this.totalOrderPrice = 0;
    this.totalQuantityToOrder = 0;
    inventoryInStockDto.inventoryQuantity += 1;

    const indexInventoryInCart = this.inventoriesInStockAddedToCart.findIndex(inv => inv.inventoryId === inventoryInStockDto.inventoryId);
    if (indexInventoryInCart !== -1) {
      this.inventoriesInStockAddedToCart.splice(indexInventoryInCart, 1);
    }

    this.inventoriesInStockAddedToCart.push(inventoryInStockDto);

    this.inventoriesInStockAddedToCart.forEach(element => {
      this.totalOrderPrice += (element.price * element.inventoryQuantity);
      this.totalQuantityToOrder += element.inventoryQuantity;
    });
  }

  removeQuantityToCart(inventoryToOrderDto: InventoryInStockDto) {
    
    if (inventoryToOrderDto.inventoryQuantity > 0) {
      this.totalOrderPrice = 0;
      this.totalQuantityToOrder = 0;
      inventoryToOrderDto.inventoryQuantity -= 1;
      const indexInventoryInCart = this.inventoriesAddedShoppingCart.findIndex(inv => inv.inventoryId === inventoryToOrderDto.inventoryId);
      this.inventoriesAddedShoppingCart.splice(indexInventoryInCart, 1);

      if (inventoryToOrderDto.inventoryQuantity > 0) {
        this.inventoriesAddedShoppingCart.push(inventoryToOrderDto);
      }

      this.inventoriesAddedShoppingCart.forEach(element => {
        this.totalOrderPrice += (element.price * element.inventoryQuantity);
        this.totalQuantityToOrder += element.inventoryQuantity;
      });
    }
  }

  async checkedOut()
  {
    this.printOrderSlipDto.totalOrderPrice = 0;
    this.printOrderSlipDto.totalQuantityToOrder = 0;
    this.customerOrdersToBePlacedItemsDto = [];

    this.printOrderSlipDto.customerFirstName = this.customerDto.firstName;
    this.printOrderSlipDto.customerSurname = this.customerDto.surname;
    this.printOrderSlipDto.totalOrderPrice = this.totalOrderPrice;
    this.printOrderSlipDto.totalQuantityToOrder = this.totalQuantityToOrder;
    
    this.inventoriesInStockAddedToCart.forEach(element => {
      this.customerOrderToBePlacedItem.inventoryName = element.productName;
      this.customerOrderToBePlacedItem.inventoryId = element.inventoryId;
      this.customerOrderToBePlacedItem.quantity = element.inventoryQuantity;
      this.customerOrderToBePlacedItem.amount = (element.inventoryQuantity * element.price);
      this.customerOrderToBePlacedItem.customerId = this.customerDto.customerId;
      this.customerOrderToBePlacedItem.locationVendorId = this.user.vendorId;
      this.customerOrderToBePlacedItem.processById = this.user.userId;
      this.customerOrdersToBePlacedItemsDto.push(Object.assign({}, this.customerOrderToBePlacedItem));
    });
    
    this.printOrderSlipDto.customerOrderItemToBePlacedDto = this.customerOrdersToBePlacedItemsDto;
    await this.dialogService.openPrintSlipModalService(PrintReceiptComponent, `print receipt`, this.printOrderSlipDto, () => { });
  }



//PrintReceiptComponent

/*





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

  */
}
