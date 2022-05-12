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

@NgModule({
  declarations: [
    AppComponent,
    LayoutComponent,
    HeaderComponent,
    SidenavListComponent,
    LoginComponent,
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
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    NoopAnimationsModule,
    
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
