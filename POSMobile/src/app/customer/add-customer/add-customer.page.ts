import { Component, OnInit } from '@angular/core';
import { AlertController, LoadingController } from '@ionic/angular';
import { CustomerDto } from 'src/app/Model/Dtos/customerDto';
import { AuthenticationService } from 'src/app/services/authentication.service';
import { CustomerService } from 'src/app/services/customer.service';
import { ModalResetParams } from 'src/app/shared/modal-reset-params';

@Component({
  selector: 'app-add-customer',
  templateUrl: './add-customer.page.html',
  styleUrls: ['./add-customer.page.scss'],
})
export class AddCustomerPage extends ModalResetParams implements OnInit {

  customerDto = {} as CustomerDto;

  constructor(authenticationService: AuthenticationService,
              private customerService: CustomerService,
              private alertController: AlertController,
              private loadingController: LoadingController) { 
    super(authenticationService)
  }

  ngOnInit() {
  }

  async createNewCustomer()
  {
    const loading = await this.loadingController.create();
    await loading.present();

     this.customerService.createNewCustomer(this.customerDto).subscribe(
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
