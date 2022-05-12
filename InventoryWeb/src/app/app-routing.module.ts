import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { CountInventoryComponent } from './admin/count-inventory/count-inventory.component';
import { SendToVendorComponent } from './admin/count-inventory/send-to-vendor/send-to-vendor.component';
import { DashboardComponent } from './dashboard/dashboard.component';
import { LoginComponent } from './login/login.component';
import { AllocateComponent } from './supervisor/allocate/allocate.component';
import { AuthGuard } from './_guards/auth.guard';

const routes: Routes = [
  { path: '', component: DashboardComponent, canActivate: [AuthGuard] },
  { path: 'allocate', component: AllocateComponent, canActivate: [AuthGuard] },
  { path: 'count-inventory', component: CountInventoryComponent, canActivate: [AuthGuard] },
  { path: 'send-inventory-vendor', component: SendToVendorComponent, canActivate: [AuthGuard] },
  { path: 'login', component: LoginComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
