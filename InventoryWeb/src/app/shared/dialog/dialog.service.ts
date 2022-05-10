import { Injectable } from '@angular/core';
import { MatDialog, MatDialogConfig } from '@angular/material/dialog';
/*
import { GamingKpisDefinitionComponent } from 'src/app/patron-detail/gaming-kpis/gaming-kpis-definition/gaming-kpis-definition.component';
import { FreePlayOtpModalComponent } from 'src/app/patron-detail/offers/patron-free-play/free-play-otp-modal/free-play-otp-modal.component';
import { VoucherOtpModalComponent } from 'src/app/patron-detail/offers/patron-voucher/voucher-otp-modal/voucher-otp-modal.component';
import { ConfigurePriceModalComponent } from 'src/app/scratch-card/update-scratch-card/list-scratch-card-prizes/configure-price-modal/configure-price-modal.component';
*/
import { AlertErrorDialogComponent } from './alert-error-dialog/alert-error-dialog.component';
import { ConfirmDialogComponent } from './confirm-dialog/confirm-dialog.component';
import { SuccessDialogComponent } from './success-dialog/success-dialog.component';

@Injectable()
export class DialogService {

  constructor(public dialog: MatDialog) { }

  openConfirmModal(title:string, message:string, yes:Function = null, no:Function = null) {
    const dialogConfig = new MatDialogConfig();

    dialogConfig.disableClose = true;
    dialogConfig.autoFocus = true;
    dialogConfig.data = {
        title: title,
        message:message
    };
    dialogConfig.minWidth = 400;

    const dialogRef = this.dialog.open(ConfirmDialogComponent, dialogConfig);

    dialogRef.afterClosed().subscribe(result => {
      if(result){
        if(yes){
          yes();
        }
      }else{
        if(no){
          no();
        }
      }
        
    });
  }

  openAlertModal(title:string, message:string, yes:Function = null, no:Function = null) {
    const dialogConfig = new MatDialogConfig();

    dialogConfig.disableClose = true;
    dialogConfig.autoFocus = true;
    dialogConfig.data = {
        title: title,
        message:message
    };
    dialogConfig.minWidth = 400;

    const dialogRef = this.dialog.open(AlertErrorDialogComponent, dialogConfig);

    dialogRef.afterClosed().subscribe(result => {
      if(result){
        if(yes){
          yes();
        }
      }
    });
  }

  openSuccessModal(title:string, message:string, yes:Function = null, no:Function = null) {
    const dialogConfig = new MatDialogConfig();

    dialogConfig.disableClose = true;
    dialogConfig.autoFocus = true;
    dialogConfig.data = {
        title: title,
        message:message
    };
    dialogConfig.minWidth = 400;

    const dialogRef = this.dialog.open(SuccessDialogComponent, dialogConfig);

    dialogRef.afterClosed().subscribe(result => {
      if(result){
        if(yes){
          yes();
        }
      }
    });
  }

//Important
  async openReturnModalService(component : any, title:string, message:any, yes:Function = null, no:Function = null) {
    const dialogConfig = new MatDialogConfig();

    dialogConfig.disableClose = true;
    dialogConfig.autoFocus = true;
    dialogConfig.data = {
        title: title,
        message:message,
        results:null
    };

    dialogConfig.position = {
      'top': '2'
    };

    dialogConfig.minWidth = 500;

    const dialogRef = this.dialog.open(component , dialogConfig);

    return dialogRef.afterClosed()
    .toPromise()
    .then(result => {
      return Promise.resolve(dialogConfig.data.results);
    });  
  }
}