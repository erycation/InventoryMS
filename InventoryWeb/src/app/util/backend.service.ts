import { HttpClient, HttpErrorResponse, HttpHeaders, HttpResponse } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { environment } from '../../environments/environment';
import { Observable } from 'rxjs';
//import { DialogService } from '../shared/dialog/dialog.service';
import { first, map } from 'rxjs/operators';

export interface BackendOptions {
  headers?: { [header: string]: string | string[]; };
  params?: { [param: string]: string | string[]; };
}

@Injectable({ providedIn: 'root' })
export class BackendService {

  busyCount = 0;

  constructor(private http: HttpClient,
    private router: Router
    //public dialogService: DialogService
    
    ) {
  }

  get busy() {
    return this.busyCount > 0;
  }

  public async get<T>(path: string, params?: { [param: string]: string | string[]; }) {

    await this.incrementBusyCount();
    let response = null;
    try {
        response = await this.http.get<T>(environment.apiUrl + path, { params }).toPromise();
    } catch (e) {
      this.handleError(e);
    } finally {
      await this.decrementBusyCount();
    }

    return response;
  }

 async postResults<T>(path: string, body: any, options?: BackendOptions) : Promise<any> {
     this.postInternal<T>(environment.apiUrl + path, body, options).pipe(first()).subscribe(results => {
      return results;
    },
      error => {
        this.handleError(error);
      });
  }

  /*
  addHero (hero: Hero): Observable<Hero> {
    return this.http.post<Hero>(this.heroesUrl, hero, httpOptions)
      .pipe(
        catchError(this.handleError('addHero', hero))
      );
  }

  */

  public  postInternal<T>(path: string, body: any, options?: BackendOptions) {
     return this.http.post<T>(path, body, options).pipe(map(results => {
      return results;
    }));
  }

  /*
  public registerUser(user: User): Observable<any> {
    return this.http.post<any>(this.baseUri + '/register', user, { headers: this.headers });
  }

  */

  public  postWithResponse1<T>(path: string, body: any, options?: BackendOptions
    ) {

      this.incrementBusyCount();
    let response = null;
    try {
      response = this.http.post<T>( environment.apiUrl + path, body, options);
    } catch (e) {
      this.handleError(e);
    } finally {
       this.decrementBusyCount();
    }

    return response;

      //return this.http.post<T>( environment.apiUrl + path, body, options);
    }

  public  postWithResponse2<T>(path: string, body: any, options?: BackendOptions
    ) {
      this.busyCount++;
      let response = null;
  
      try {
        response =  this.http.post<T>(
          environment.apiUrl + path, body, options
        );
      
      } catch (e) {
        this.handleError(e);
      } finally {
        this.busyCount--;
      }
  
      return response;
    }

  public async postWithResponse<T>(path: string, body: any, options?: BackendOptions
  ) {
    await this.incrementBusyCount();
    let response = null;

    try {
      response = await this.http.post<T>(
        environment.apiUrl + path, body, options
      ).toPromise();
    
    } catch (e) {
      this.handleError(e);
    } finally {
      await this.decrementBusyCount();
    }

    return response;
  }

  private async incrementBusyCount() {
    await Promise.resolve(); // prevent ExpressionChangedAfterItHasBeenCheckedError
    this.busyCount++;
  }

  private async decrementBusyCount() {
    await Promise.resolve(); // prevent ExpressionChangedAfterItHasBeenCheckedError
    this.busyCount--;
  }

  private handleError(error: any) {
    
    switch (error.status) {

      case 400:
        alert('errfdfd ')
        //this.dialogService.openAlertModal("Alert", `${error.error.message}`, () => { });
        break;

      case 401:
        alert('errfdfd ')
       // this.dialogService.openAlertModal("Alert", "UnAuthorized, System will automatically logout.", () => { });
        this.router.navigateByUrl("/login");
        break;

      case 403:
        alert('errfdfd ')
       // this.dialogService.openAlertModal("Alert", "forbidden, System will automatically logout.", () => { });
        this.router.navigateByUrl("/login");
        break;

      case 500:
        alert('errfdfd ')
      //  this.dialogService.openAlertModal("Alert", `${error.message}`, () => { });
        break;

      default:
       // this.dialogService.openAlertModal("Alert", `Status Error Code : ${error.status} .Contact system administrator`, () => { });
        this.router.navigateByUrl("/login");
        break;
    }
  }
}