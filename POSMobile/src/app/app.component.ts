import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { AuthToken } from './Model/Dtos/loginDto/authToken';
import { AuthenticationService } from './services/authentication.service';
import { ModalResetParams } from './shared/modal-reset-params';
@Component({
  selector: 'app-root',
  templateUrl: 'app.component.html',
  styleUrls: ['app.component.scss'],
})
export class AppComponent extends ModalResetParams{

  public appPages = [
    { title: 'Customer', url: '', icon: 'mail' },
    { title: 'Receive Inventory', url: '/inventory/', icon: 'paper-plane' },
    { title: 'Stock Taking', url: '/folder/Stock Taking', icon: 'heart' },
    { title: 'Logout', url: '/login', icon: 'warning' },
  ];
  /*
  public appPages = [
    { title: 'Inbox', url: '/folder/Inbox', icon: 'mail' },
    { title: 'Outbox', url: '/folder/Outbox', icon: 'paper-plane' },
    { title: 'Favorites', url: '/folder/Favorites', icon: 'heart' },
    { title: 'Archived', url: '/folder/Archived', icon: 'archive' },
    { title: 'Trash', url: '/folder/Trash', icon: 'trash' },
    { title: 'Spam', url: '/folder/Spam', icon: 'warning' },
  ];
  */
  public labels = ['Family', 'Friends', 'Notes', 'Work', 'Travel', 'Reminders'];
  constructor(authenticationService: AuthenticationService) { 
              super(authenticationService)
    }
}
