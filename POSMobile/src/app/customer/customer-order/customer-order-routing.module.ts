import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { CustomerOrderPage } from './customer-order.page';

const routes: Routes = [
  {
    path: '',
    component: CustomerOrderPage
  },
  {
    path: 'checkout-modal',
    loadChildren: () => import('./modal/checkout-modal/checkout-modal.module').then( m => m.CheckoutModalPageModule)
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class CustomerOrderPageRoutingModule {}
