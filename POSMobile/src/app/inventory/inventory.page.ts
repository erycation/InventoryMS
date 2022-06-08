import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AlertController, LoadingController } from '@ionic/angular';
import { InventoryTransactionDto } from '../Model/Dtos/inventoryTransactionDto';
import { AuthenticationService } from '../services/authentication.service';
import { InventoryTransactionService } from '../services/inventory-transaction.service';
import { ModalResetParams } from '../shared/modal-reset-params';

@Component({
  selector: 'app-inventory',
  templateUrl: './inventory.page.html',
  styleUrls: ['./inventory.page.scss'],
})
export class InventoryPage extends ModalResetParams implements OnInit {

  inventoryTransactionsDto: InventoryTransactionDto[] = [];

  constructor(authenticationService: AuthenticationService,
              private router: Router,
              private inventoryTransactionService: InventoryTransactionService,
              private alertController: AlertController,
              private loadingController: LoadingController) { 
    super(authenticationService)
  }

  async ngOnInit() {
    await this.loadInventoryToAccept();
  }

  async loadInventoryToAccept()
  {
    const loading = await this.loadingController.create();
    await loading.present();

    this.inventoryTransactionService.getAwaitingInventoriesToAccepted(this.user.vendorId).subscribe(
      async data => {    
        this.inventoryTransactionsDto = data;
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

  async acceptInventories()
  {
    const loading = await this.loadingController.create();
    await loading.present();
    this.inventoryTransactionService.acceptInventoryInBranch(this.inventoryTransactionsDto,this.user.vendorId,this.user.userId).subscribe(
      async data => {    
        await loading.dismiss(); 
        const alert = await this.alertController.create({
          header: 'Success',
          message: data.message,
          buttons: ['OK'],
        });   
        await alert.present();
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
}
