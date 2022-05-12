import { Component, EventEmitter, OnInit, Output } from '@angular/core';
import { Router } from '@angular/router';
import { AuthToken } from 'src/app/model/loginDto/authToken';
import { AccountService } from 'src/app/service/account.service';

@Component({
  selector: 'app-sidenav-list',
  templateUrl: './sidenav-list.component.html',
  styleUrls: ['./sidenav-list.component.css']
})
export class SidenavListComponent implements OnInit {

  @Output() sidenavClose = new EventEmitter();
  user: AuthToken | undefined;

  constructor(private router: Router,
    private accountService: AccountService) {

    this.accountService.user.subscribe(x => this.user = x);
  }

  ngOnInit() {

    
  }

  supervisorRight()
  {
    return this.user?.roleDescription != null ? this.user?.roleDescription?.toLocaleLowerCase() == 'supervisor' : true? false : false;
  }

  adminRight()
  {
    return this.user?.roleDescription != null ? this.user?.roleDescription?.toLocaleLowerCase() == 'admin' : true? false : false;
  }
  
  public onSidenavClose = () => {
    this.sidenavClose.emit();
  }

  public goToPage(pageRoute: string) {
    this.router.navigate([pageRoute]);
    this.onSidenavClose();
  }
}
