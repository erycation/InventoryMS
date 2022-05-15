import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AdminProductionComponent } from './admin-production/admin-production.component';
import { CountInventoryComponent } from './admin/count-inventory/count-inventory.component';
import { SendToVendorComponent } from './admin/count-inventory/send-to-vendor/send-to-vendor.component';
import { DashboardComponent } from './dashboard/dashboard.component';
import { LoginComponent } from './login/login.component';
import { CreateOrderComponent } from './sales-vendor/customer-list/create-order/create-order.component';
import { CustomerListComponent } from './sales-vendor/customer-list/customer-list.component';
import { StockTakingComponent } from './sales-vendor/stock-taking/stock-taking.component';
import { AllocateComponent } from './supervisor/allocate/allocate.component';
import { MonitorStockTakingComponent } from './supervisor/monitor-stock-taking/monitor-stock-taking.component';
import { UserListComponent } from './supervisor/user-list/user-list.component';
import { AddVendorComponent } from './supervisor/vendor-list/add-vendor/add-vendor.component';
import { ModifyVendorComponent } from './supervisor/vendor-list/modify-vendor/modify-vendor.component';
import { VendorListComponent } from './supervisor/vendor-list/vendor-list.component';
import { AuthGuard } from './_guards/auth.guard';

const routes: Routes = [
  { path: '', component: DashboardComponent, canActivate: [AuthGuard] },
  { path: 'allocate', component: AllocateComponent, canActivate: [AuthGuard] },
  { path: 'vendor-list', component: VendorListComponent, canActivate: [AuthGuard] },
  { path: 'user-list', component: UserListComponent, canActivate: [AuthGuard] },
  { path: 'count-inventory', component: CountInventoryComponent, canActivate: [AuthGuard] },
  { path: 'customer-list', component: CustomerListComponent, canActivate: [AuthGuard] },
  { path: 'create-order/:customerId', component: CreateOrderComponent, canActivate: [AuthGuard] },
  { path: 'send-inventory-vendor', component: SendToVendorComponent, canActivate: [AuthGuard] },
  { path: 'stock-taking', component: StockTakingComponent, canActivate: [AuthGuard] },
  { path: 'monitor-stock-taking', component: MonitorStockTakingComponent, canActivate: [AuthGuard] },
  { path: 'admin-production', component: AdminProductionComponent, canActivate: [AuthGuard] },
  { path: 'login', component: LoginComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
