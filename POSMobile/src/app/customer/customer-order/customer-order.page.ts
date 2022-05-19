import { ChangeDetectorRef, Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { AlertController, LoadingController } from '@ionic/angular';
import { CustomerDto } from 'src/app/Model/Dtos/customerDto';
import { InventoryDto } from 'src/app/Model/Dtos/inventoryDto';
import { AuthenticationService } from 'src/app/services/authentication.service';
import { CustomerService } from 'src/app/services/customer.service';
import { InventoryService } from 'src/app/services/inventory.service';
import { ModalResetParams } from 'src/app/shared/modal-reset-params';

@Component({
  selector: 'app-customer-order',
  templateUrl: './customer-order.page.html',
  styleUrls: ['./customer-order.page.scss'],
})
export class CustomerOrderPage extends ModalResetParams implements OnInit {

  customerDto = {} as CustomerDto;
  inventoryDto: InventoryDto[] = []

  items: Object[] = []
    itemsInCart: Object[] = [];
    cartBadgeState: string = 'idle';

  constructor(authenticationService: AuthenticationService,
              private customerService: CustomerService,
              private alertController: AlertController,
              private loadingController: LoadingController,
              private activatedRoute: ActivatedRoute,
              private inventoryService : InventoryService,
              private changeDetector: ChangeDetectorRef) { 
    super(authenticationService);

    this.items = [
      {title: 'Something', quantityInCart: 0},
      {title: 'Something', quantityInCart: 0},
      {title: 'Something', quantityInCart: 0},
      {title: 'Something', quantityInCart: 0}
  ];
}

addQuantityToCart(inventoryDto: InventoryDto){
  inventoryDto.inventoryQuantity=0;
  inventoryDto.inventoryQuantity += 1;
  //this.itemsInCart.push(item);
}









addToCart(item){
  item.quantityInCart += 1;
  this.itemsInCart.push(item);
}

removeToCart(item){
  item.quantityInCart -= 1;
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

     this.inventoryService.getAllInventories().subscribe(
      async data => {    
        this.inventoryDto = data;
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

     this.inventoryService.getAllInventories().subscribe(
      async data => {    
        this.inventoryDto = data;
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


 
addToCartFinished(item){
    this.cartBadgeState = 'idle';
    item.addButtonState = 'idle';
}

}
