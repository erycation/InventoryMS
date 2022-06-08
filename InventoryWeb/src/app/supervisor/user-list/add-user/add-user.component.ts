import { Component, OnInit } from '@angular/core';
import { MatDialogRef } from '@angular/material/dialog';
import { Router } from '@angular/router';
import { RoleDto } from 'src/app/model/Dtos/ms-inventory/roleDto';
import { UserDto } from 'src/app/model/Dtos/ms-inventory/userDto';
import { VendorDto } from 'src/app/model/Dtos/ms-inventory/vendorDto';
import { AccountService } from 'src/app/service/account.service';
import { RoleService } from 'src/app/service/ms-inventory/role.service';
import { UserService } from 'src/app/service/ms-inventory/user.service';
import { VendorService } from 'src/app/service/ms-inventory/vendor.service';
import { DialogService } from 'src/app/shared/dialog/dialog.service';
import { ModalResetParams } from 'src/app/shared/modal-reset-params';
import { SharedFunction } from 'src/app/shared/shared-function';

@Component({
  selector: 'app-add-user',
  templateUrl: './add-user.component.html',
  styleUrls: ['./add-user.component.css']
})
export class AddUserComponent extends ModalResetParams implements OnInit {

  userDto = {} as UserDto;
  rolesDto: RoleDto[] = [];
  vendorsDto: VendorDto[] = [];
  confirmPassword : string;

  constructor(public dialogRef: MatDialogRef<AddUserComponent>,
    accountService: AccountService,
    router: Router,
    private dialogService : DialogService,
    private userService: UserService,
    private roleService: RoleService,
    private vendorService: VendorService) {
    super(accountService,
      router);

  }

  async ngOnInit() {
    this.rolesDto = await this.roleService.getAllRoles();
    this.vendorsDto = await this.vendorService.getAllVendors();
  }

  async closeDialog()
  {
    this.dialogRef.close();
  }

  async saveUser()
  {

    if (!SharedFunction.checkUndefinedObjectValue(this.userDto.firstname)) {
      this.dialogService.openAlertModal(`Alert`,`Firstname required`);
      return;
    }else if (!SharedFunction.checkUndefinedObjectValue(this.userDto.surname)) {
      this.dialogService.openAlertModal(`Alert`,`Surname required`);
      return;
    }else if (!SharedFunction.checkUndefinedObjectValue(this.userDto.username)) {
      this.dialogService.openAlertModal(`Alert`,`Username required`);
      return;
    }else if (!SharedFunction.checkUndefinedObjectValue(this.userDto.password)) {
      this.dialogService.openAlertModal(`Alert`,`Password required`);
      return;
    }else if (this.userDto.password != this.confirmPassword) {
      this.dialogService.openAlertModal(`Alert`,`Password not same as confirm password`);
      return;
    }else if (!SharedFunction.checkUndefinedObjectValue(this.userDto.vendorId)) {
      this.dialogService.openAlertModal(`Alert`,`Vendor required`);
      return;
    }else if (!SharedFunction.checkUndefinedObjectValue(this.userDto.roleDescription)) {
      this.dialogService.openAlertModal(`Alert`,`Role required`);
      return;
    }

    this.userService.createUser(this.userDto).subscribe(
      data => {         
        this.dialogService.openSuccessModal(`Successfully`, data.message);
        this.closeDialog();
      },
      error => {        
       this.dialogService.openAlertModal(`Error`, error.error.message);       
      });
  }
}

