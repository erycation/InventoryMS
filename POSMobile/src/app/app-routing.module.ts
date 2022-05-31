import { NgModule } from '@angular/core';
import { PreloadAllModules, RouterModule, Routes } from '@angular/router';
import { AuthGuard } from './guards/auth.guard';

const routes: Routes = [
  {
    path: '',
    redirectTo: 'folder/Inbox',
    pathMatch: 'full'
  },
  {
    path: 'folder/:id',
    loadChildren: () => import('./folder/folder.module').then( m => m.FolderPageModule)
  },
  {
    path: 'inventory',
    loadChildren: () => import('./inventory/inventory.module').then( m => m.InventoryPageModule),
    canLoad: [AuthGuard] // Secure all child pages
  },
  {
    path: 'login',
    loadChildren: () => import('./login/login.module').then( m => m.LoginPageModule)
  },
  {
    path: 'customer',
    loadChildren: () => import('./customer/customer.module').then( m => m.CustomerPageModule),
    canLoad: [AuthGuard] // Secure all child pages
  } ,
  {
    path: 'add-customer',
    loadChildren: () => import('./customer/add-customer/add-customer.module').then( m => m.AddCustomerPageModule),
    canLoad: [AuthGuard] // Secure all child pages
  } ,
  {
    path: 'customer-order/:customerId/:fullnames',
    loadChildren: () => import('./customer/customer-order/customer-order.module').then( m => m.CustomerOrderPageModule),
    canLoad: [AuthGuard] // Secure all child pages
  }/*,
  {
    path: 'checkout-modal',
    loadChildren: () => import('./customer/customer-order/modal/checkout-modal/checkout-modal.module').then( m => m.CheckoutModalPageModule),
    canLoad: [AuthGuard] // Secure all child pages
  }  */
];

@NgModule({
  imports: [
    RouterModule.forRoot(routes, { preloadingStrategy: PreloadAllModules })
  ],
  exports: [RouterModule]
})
export class AppRoutingModule {}
