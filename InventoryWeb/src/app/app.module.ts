import { NgModule, CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';


import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { BrowserAnimationsModule, NoopAnimationsModule } from '@angular/platform-browser/animations';
import { MaterialModule } from './material/material.module';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { AuthInterceptor } from './shared/authconfig.interceptor';
import { DialogService } from './shared/dialog/dialog.service';
import { LoginComponent } from './login/login.component';
import { DashboardComponent } from './dashboard/dashboard.component';
import { SuccessDialogComponent } from './shared/dialog/success-dialog/success-dialog.component';
import { AlertErrorDialogComponent } from './shared/dialog/alert-error-dialog/alert-error-dialog.component';
import { ConfirmDialogComponent } from './shared/dialog/confirm-dialog/confirm-dialog.component';
import { UserDetailsComponent } from './user-details/user-details.component';
import { LayoutComponent } from './layout/layout.component';
import { HeaderComponent } from './navigation/header/header.component';
import { SidenavListComponent } from './navigation/sidenav-list/sidenav-list.component';
import { SupervisorComponent } from './supervisor/supervisor.component';
import { AllocateComponent } from './supervisor/allocate/allocate.component';
import { AdminComponent } from './admin/admin.component';
import { CountInventoryComponent } from './admin/count-inventory/count-inventory.component';
import { SendToVendorComponent } from './admin/count-inventory/send-to-vendor/send-to-vendor.component';
import { CreateInventoryComponent } from './supervisor/allocate/create-inventory/create-inventory.component';
import { StartCountInventoryComponent } from './admin/count-inventory/start-count-inventory/start-count-inventory.component';
import { SalesVendorComponent } from './sales-vendor/sales-vendor.component';
import { ReceiveStockComponent } from './sales-vendor/receive-stock/receive-stock.component';
import { AcceptInventoryComponent } from './dashboard/accept-inventory/accept-inventory.component';
import { StockTakingComponent } from './sales-vendor/stock-taking/stock-taking.component';
import { MonitorStockTakingComponent } from './supervisor/monitor-stock-taking/monitor-stock-taking.component';
import { ViewStockTakingComponent } from './supervisor/monitor-stock-taking/view-stock-taking/view-stock-taking.component';
import { VendorListComponent } from './supervisor/vendor-list/vendor-list.component';
import { AddVendorComponent } from './supervisor/vendor-list/add-vendor/add-vendor.component';
import { ModifyVendorComponent } from './supervisor/vendor-list/modify-vendor/modify-vendor.component';
import { UserListComponent } from './supervisor/user-list/user-list.component';
import { AddUserComponent } from './supervisor/user-list/add-user/add-user.component';
import { ModifyUserComponent } from './supervisor/user-list/modify-user/modify-user.component';
import { CustomerListComponent } from './sales-vendor/customer-list/customer-list.component';
import { AddCustomerComponent } from './sales-vendor/customer-list/add-customer/add-customer.component';
import { ModifyCustomerComponent } from './sales-vendor/customer-list/modify-customer/modify-customer.component';
import { CreateOrderComponent } from './sales-vendor/customer-list/create-order/create-order.component';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { AdminProductionComponent } from './admin-production/admin-production.component';
import { CaptureInventoryProductionComponent } from './admin-production/capture-inventory-production/capture-inventory-production.component';
import { InventoryListComponent } from './supervisor/inventory-list/inventory-list.component';
import { AddInventoryComponent } from './supervisor/inventory-list/add-inventory/add-inventory.component';
import { NumberDirective } from './shared/numbers-only.directive';
import { ModifyInventoryComponent } from './supervisor/inventory-list/modify-inventory/modify-inventory.component';
import { VendorPipe } from './shared/pipes/vendor.pipes';

@NgModule({
  declarations: [
    AppComponent,
    LayoutComponent,
    HeaderComponent,
    SidenavListComponent,
    VendorPipe,
    LoginComponent,
    NumberDirective,
    DashboardComponent,
    ConfirmDialogComponent,
    AlertErrorDialogComponent,
    SuccessDialogComponent,
    UserDetailsComponent,
    SupervisorComponent,
    AllocateComponent,
    AdminComponent,
    CountInventoryComponent,
    SendToVendorComponent,
    CreateInventoryComponent,
    StartCountInventoryComponent,
    SalesVendorComponent,
    ReceiveStockComponent,
    AcceptInventoryComponent,
    StockTakingComponent,
    MonitorStockTakingComponent,
    ViewStockTakingComponent,
    VendorListComponent,
    AddVendorComponent,
    ModifyVendorComponent,
    UserListComponent,
    AddUserComponent,
    ModifyUserComponent,
    CustomerListComponent,
    AddCustomerComponent,
    ModifyCustomerComponent,
    CreateOrderComponent,
    AdminProductionComponent,
    CaptureInventoryProductionComponent,
    InventoryListComponent,
    AddInventoryComponent,
    ModifyInventoryComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    NoopAnimationsModule,
    NgbModule,
    FormsModule,
    ReactiveFormsModule,
    HttpClientModule,

    MaterialModule
  ],
  schemas: [ CUSTOM_ELEMENTS_SCHEMA ],
  providers: [ 
    {
    provide: HTTP_INTERCEPTORS,
    useClass: AuthInterceptor,
    multi: true
    },
     DialogService,
    //DatePipe
    ],
  bootstrap: [AppComponent]
})
export class AppModule { }
