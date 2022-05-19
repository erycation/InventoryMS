import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AlertController, LoadingController } from '@ionic/angular';
import { CustomerDto } from '../Model/Dtos/customerDto';
import { AuthenticationService } from '../services/authentication.service';
import { CustomerService } from '../services/customer.service';
import { ModalResetParams } from '../shared/modal-reset-params';

@Component({
  selector: 'app-customer',
  templateUrl: './customer.page.html',
  styleUrls: ['./customer.page.scss'],
})
export class CustomerPage extends ModalResetParams implements OnInit {

  customersDto: CustomerDto[] = [];
  customerNameSearch: string;

  constructor(authenticationService: AuthenticationService,
              private router: Router,
              private customerService: CustomerService,
              private alertController: AlertController,
              private loadingController: LoadingController) { 
    super(authenticationService)
  }

  async onInput(ev: any) {
      if(ev.target.value.length > 2)
      {
        await this.getCustomers(ev.target.value);
      }
  }

  onCancel(ev: any) {
    let val = ev.target.value;
  }

  async ngOnInit() {
    this.user.vendorName;
    await this.getCustomers('mal');
  }

  async getCustomers(customerName : string)
  {
    const loading = await this.loadingController.create();
    await loading.present();

     this.customerService.searchCustomers(customerName).subscribe(
      async data => {    
        this.customersDto = data;
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

  async createNewCustomer()
  {
    const loading = await this.loadingController.create();
    await loading.present();
    this.router.navigateByUrl('add-customer', { replaceUrl: false });
    await loading.dismiss();
  }

  async createNewOrder(customersDto: CustomerDto)
  {
    const loading = await this.loadingController.create();
    await loading.present();
    this.router.navigateByUrl(`customer-order/${customersDto.customerId}/${customersDto.fullnames}`, { replaceUrl: false });
    await loading.dismiss();
  }
}
