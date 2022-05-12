import { Component, EventEmitter, OnInit, Output } from '@angular/core';
import { Router } from '@angular/router';
import { AuthToken } from 'src/app/model/loginDto/authToken';
import { AccountService } from 'src/app/service/account.service';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})
export class HeaderComponent implements OnInit {

  @Output() public sidenavToggle = new EventEmitter();  
  user: AuthToken | undefined;

  constructor(private router: Router,
    private accountService: AccountService) {

    this.accountService.user.subscribe(x => this.user = x);
  }

  ngOnInit(): void {
  }

  goToPage(routeName : string) {
    this.router.navigate([routeName]);
  }
  
  public onToggleSidenav = () => {
    this.sidenavToggle.emit();
  }
}