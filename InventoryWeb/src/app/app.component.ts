import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { environment } from 'src/environments/environment';
import { AuthToken } from './model/loginDto/authToken';
import { AccountService } from './service/account.service';
import { BackendService } from './util/backend.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'InventoryWeb';
  user: AuthToken | undefined;
  appVersion = environment.version;

  constructor(private router: Router,
    private backend: BackendService,
    private accountService: AccountService) {

      this.accountService.user.subscribe(x => this.user = x);
  }

  get busy() {
    return this.backend.busy;
  }

  goToPage(routeName: any) {
    this.router.navigate([routeName]);
  }

  logout() {
    this.accountService.logout();
  }
}
