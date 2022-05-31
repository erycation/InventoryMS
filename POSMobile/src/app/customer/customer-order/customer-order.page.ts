import { ChangeDetectorRef, Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { AlertController, LoadingController, ModalController } from '@ionic/angular';
import { CustomerDto } from 'src/app/Model/Dtos/customerDto';
import { InventoryToOrderDto } from 'src/app/Model/Dtos/inventoryToOrderDto';
import { AuthenticationService } from 'src/app/services/authentication.service';
import { CustomerService } from 'src/app/services/customer.service';
import { InventoryService } from 'src/app/services/inventory.service';
import { ModalResetParams } from 'src/app/shared/modal-reset-params';
import { CheckoutModalPage } from './modal/checkout-modal/checkout-modal.page';

@Component({
  selector: 'app-customer-order',
  templateUrl: './customer-order.page.html',
  styleUrls: ['./customer-order.page.scss'],
})
export class CustomerOrderPage extends ModalResetParams implements OnInit {

  customerDto = {} as CustomerDto;
  inventoriesToOrderDto: InventoryToOrderDto[] = []
  inventoriesToInCart: InventoryToOrderDto[] = []
  totalOrderPrice:number = 0;
  totalQuantityToOrder :number = 0;

  constructor(authenticationService: AuthenticationService,
              private customerService: CustomerService,
              private alertController: AlertController,
              private loadingController: LoadingController,
              private activatedRoute: ActivatedRoute,
              private inventoryService : InventoryService,
              private changeDetector: ChangeDetectorRef,
              public modalCtrl: ModalController) { 
    super(authenticationService);
}

addQuantityToCart(inventoryToOrderDto: InventoryToOrderDto){

  this.totalOrderPrice = 0;
  this.totalQuantityToOrder = 0;

  inventoryToOrderDto.inventoryQuantity += 1;

  const indexInventoryInCart = this.inventoriesToInCart.findIndex(inv => inv.inventoryId === inventoryToOrderDto.inventoryId);
    if(indexInventoryInCart !== -1)
    {
      this.inventoriesToInCart.splice(indexInventoryInCart, 1);      
    }

  this.inventoriesToInCart.push(inventoryToOrderDto);  
  
  this.inventoriesToInCart.forEach(element => {
    this.totalOrderPrice += (element.price * element.inventoryQuantity);
    this.totalQuantityToOrder += element.inventoryQuantity;
  })



  //inventoryToOrderDto.inventoryQuantity += 1;
  //this.totalOrderPrice += inventoryToOrderDto.price;
  //this.inventoriesToInCart.push(inventoryToOrderDto);
}

removeQuantityToCart(inventoryToOrderDto: InventoryToOrderDto){

  this.totalOrderPrice = 0;
  this.totalQuantityToOrder = 0;
  inventoryToOrderDto.inventoryQuantity -= 1;
  const indexInventoryInCart = this.inventoriesToInCart.findIndex(inv => inv.inventoryId === inventoryToOrderDto.inventoryId);
  this.inventoriesToInCart.splice(indexInventoryInCart, 1); 
    
      if(inventoryToOrderDto.inventoryQuantity > 0)
      {
        this.inventoriesToInCart.push(inventoryToOrderDto);  
      }
  

this.inventoriesToInCart.forEach(element => {
  this.totalOrderPrice += (element.price * element.inventoryQuantity);
  this.totalQuantityToOrder += element.inventoryQuantity;
});

/*

  if(inventoryToOrderDto.inventoryQuantity > 0)
  {
    inventoryToOrderDto.inventoryQuantity -= 1;
    this.totalOrderPrice -= inventoryToOrderDto.price;

    const index = this.inventoriesToInCart.findIndex(inventory => inventory.inventoryId === inventoryToOrderDto.inventoryId);
    if(index == 0)
    {
      this.inventoriesToInCart.splice(index, 1);      
    }

    */
    //remove in card
  
 }

removeQuantityToCart111(inventoryToOrderDto: InventoryToOrderDto){
  if(inventoryToOrderDto.inventoryQuantity > 0)
  {
    inventoryToOrderDto.inventoryQuantity -= 1;
    this.totalOrderPrice -= inventoryToOrderDto.price;

    const index = this.inventoriesToInCart.findIndex(inventory => inventory.inventoryId === inventoryToOrderDto.inventoryId);
    if(index == 0)
    {
      this.inventoriesToInCart.splice(index, 1);      
    }
    //remove in card
  }
 }

 async processOrderToFinish() {

  if(this.inventoriesToInCart.length == 0)
    {
      const alert =  await this.alertController.create({
        header: 'Alert',
        message: 'Add Items To Card Befor Checkout.',
        buttons: ['OK'],
      });      
      await alert.present(); 
    }else{

    const modal = await this.modalCtrl.create({
      
      component: CheckoutModalPage,
      initialBreakpoint: 0.5,
      breakpoints: [0, 0.5, 1],
      componentProps: { inventoriesToInCart: this.inventoriesToInCart }
    });
    return await modal.present();
  }
}

  async ngOnInit() {
    this.customerDto.customerId = this.activatedRoute.snapshot.paramMap.get('customerId');
    this.customerDto.fullnames = this.activatedRoute.snapshot.paramMap.get('fullnames');

    await this.getAllInventories();
  }

  async getAllInventories()
  {
    const loading = await this.loadingController.create();
    await loading.present();

     this.inventoryService.getAllInventoriesToOrder().subscribe(
      async data => {    
        this.inventoriesToOrderDto = data;
        await loading.dismiss();
      },
        async error => {     
          await loading.dismiss();
          const alert =  await this.alertController.create({
            header: 'Error',
            message: error.error.message,
            buttons: ['OK'],
          });      
          await alert.present();        
      });      

}

async populateInventories()
  {
    const loading = await this.loadingController.create();
    await loading.present();

     this.inventoryService.getAllInventoriesToOrder().subscribe(
      async data => {    
        this.inventoriesToOrderDto = data;
        await loading.dismiss();
      },
        async error => {     
          await loading.dismiss();
          const alert =  await this.alertController.create({
            header: 'Error',
            message: error.error.message,
            buttons: ['OK'],
          });      
          await alert.present();        
      });      

}


 

/*
    this.items = [
      {title: 'Something', quantityInCart: 0},
      {title: 'Something', quantityInCart: 0},
      {title: 'Something', quantityInCart: 0},
      {title: 'Something', quantityInCart: 0}
  ];
addToCart(item){
  item.quantityInCart += 1;
  this.itemsInCart.push(item);
}

removeToCart(item){
  item.quantityInCart -= 1;
}
  
addToCartFinished(item){
    this.cartBadgeState = 'idle';
    item.addButtonState = 'idle';
}

*/

}
