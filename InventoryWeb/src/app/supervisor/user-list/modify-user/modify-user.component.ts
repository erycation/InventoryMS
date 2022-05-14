import { Component, Inject, OnInit } from '@angular/core';
import { MAT_DIALOG_DATA } from '@angular/material/dialog';
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
  selector: 'app-modify-user',
  templateUrl: './modify-user.component.html',
  styleUrls: ['./modify-user.component.css']
})
export class ModifyUserComponent extends ModalResetParams implements OnInit {

  userDto = {} as UserDto;
  rolesDto: RoleDto[] = [];
  vendorsDto: VendorDto[] = [];
  confirmPassword : string;

  constructor(accountService: AccountService,
    router: Router,
    @Inject(MAT_DIALOG_DATA) public data: any,
    private dialogService : DialogService,
    private userService: UserService,
    private roleService: RoleService,
    private vendorService: VendorService) {
    super(accountService,
      router);
      this.userDto = data.message;
  }

  async ngOnInit() {
    this.rolesDto = await this.roleService.getAllRoles();
    this.vendorsDto = await this.vendorService.getAllVendors();
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
    }else if (!SharedFunction.checkUndefinedObjectValue(this.userDto.vendorId)) {
      this.dialogService.openAlertModal(`Alert`,`Vendor required`);
      return;
    }else if (!SharedFunction.checkUndefinedObjectValue(this.userDto.roleDescription)) {
      this.dialogService.openAlertModal(`Alert`,`Role required`);
      return;
    }

    this.userService.updateUser(this.userDto).subscribe(
      data => {         
        this.dialogService.openSuccessModal(`Successfully`, data.message);
      },
      error => {        
       this.dialogService.openAlertModal(`Error`, error.error.message);       
      });
  }
}

