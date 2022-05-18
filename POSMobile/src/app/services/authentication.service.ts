import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { map, tap, switchMap } from 'rxjs/operators';
import { BehaviorSubject, from, Observable, Subject } from 'rxjs';
 
import { Storage } from '@capacitor/storage';
import { AuthToken } from '../Model/Dtos/loginDto/authToken';
 
 
const TOKEN_KEY = 'my-token';
 
@Injectable({
  providedIn: 'root'
})
export class AuthenticationService {
  // Init with null to filter out the first value in a guard!
  isAuthenticated: BehaviorSubject<boolean> = new BehaviorSubject<boolean>(null);
  token = '';
  private userSubject: BehaviorSubject<AuthToken>;
  public user: Observable<AuthToken>;
 
  constructor(private http: HttpClient) {
    this.loadToken();

    this.userSubject = new BehaviorSubject<AuthToken>(JSON.parse(localStorage.getItem('user') || '{}'));
    this.user = this.userSubject.asObservable();

  }

  public get userValue(): AuthToken {
    return this.userSubject.value; 
}
 
  async loadToken() {
    const token = await Storage.get({ key: TOKEN_KEY });    
    const token1 = await JSON.parse(localStorage.getItem('user'));    
    console.log(token1)
    if (token && token.value) {
      console.log('set token: ', token);
      this.token = token.value;
      this.isAuthenticated.next(true);
    } else {
      this.isAuthenticated.next(false);
    }
  }
 
  login(credentials: {username, password}): Observable<any> {
    return this.http.post(`https://localhost:44385/api/login`, credentials).pipe(
      map((data: any) => data),
      switchMap(token => {
        //localStorage.setItem('user', JSON.stringify(token));

        localStorage.setItem('user', JSON.stringify(token));
        this.userSubject.next(token);

        return from(Storage.set({key: TOKEN_KEY, value: token.token}));
      }),
      tap(_ => {
        this.isAuthenticated.next(true);
      })
    )
  }
 
  logout(): Promise<void> {
    this.isAuthenticated.next(false);
    localStorage.removeItem('user');
    return Storage.remove({key: TOKEN_KEY});
  }
}