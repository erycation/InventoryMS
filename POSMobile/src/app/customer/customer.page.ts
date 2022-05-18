import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { LoadingController } from '@ionic/angular';
import { AuthenticationService } from '../services/authentication.service';
import { ModalResetParams } from '../shared/modal-reset-params';

@Component({
  selector: 'app-customer',
  templateUrl: './customer.page.html',
  styleUrls: ['./customer.page.scss'],
})
export class CustomerPage extends ModalResetParams implements OnInit {

  constructor(authenticationService: AuthenticationService,
              private router: Router,
              private loadingController: LoadingController) { 
    super(authenticationService)
  }

  ngOnInit() {
    this.user.vendorName
  }

  async createNewCustomer()
  {
    const loading = await this.loadingController.create();
    await loading.present();
    this.router.navigateByUrl('add-customer', { replaceUrl: false });
    await loading.dismiss();
  }
}
