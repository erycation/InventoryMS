import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { UserDto } from 'src/app/model/Dtos/ms-inventory/userDto';
import { AccountService } from 'src/app/service/account.service';
import { UserService } from 'src/app/service/ms-inventory/user.service';
import { DialogService } from 'src/app/shared/dialog/dialog.service';
import { ModalResetParams } from 'src/app/shared/modal-reset-params';
import { AddUserComponent } from './add-user/add-user.component';
import { ModifyUserComponent } from './modify-user/modify-user.component';

@Component({
  selector: 'app-user-list',
  templateUrl: './user-list.component.html',
  styleUrls: ['./user-list.component.css']
})
export class UserListComponent extends ModalResetParams implements OnInit {

  usersDto: UserDto[] = [];

  constructor(accountService: AccountService,
    router: Router,
    private dialogService : DialogService,
    private userService: UserService) {
    super(accountService,
      router);
  }

  async ngOnInit() {
    await this.loadUsers();
  }

  async loadUsers()
  {
    this.usersDto = await this.userService.getAllUsers();
  }

  async addUser()
  {
    await this.dialogService.openReturnModalService(AddUserComponent, `Add User`, null, () => { });
    await this.loadUsers();
  }

  async modifyUser(userDto: UserDto)
  {
    await this.dialogService.openReturnModalService(ModifyUserComponent, `Modify User`, userDto, () => { });
    await this.loadUsers();
  }

  supervisorRight(roleDescription : string)
  {
    return roleDescription.toLocaleLowerCase() == 'supervisor' ? true : false;
  }
}
