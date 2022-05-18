import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { map, tap, switchMap } from 'rxjs/operators';
import { BehaviorSubject, from, Observable, Subject } from 'rxjs';
import { Storage } from '@capacitor/storage';
import { CustomerDto } from '../Model/Dtos/customerDto';
import { LoadingController } from '@ionic/angular';


 
@Injectable({
  providedIn: 'root'
})
export class CustomerService {
 
  constructor(private http: HttpClient) {
   
  }

  /*
  updateCustomer(cust: Customer): Observable<Customer> {
    return this.http.post<Customer>(`/api/customer/${id}`, cust);
  }
  */

  createNewCustomer(customerDto : CustomerDto): Observable<any> {    
    return this.http.post(`https://localhost:44385/api/Customer/Add`, customerDto)
  }


  createNewCustomer1(customerDto : CustomerDto): Observable<any> {

    
    return this.http.post(`https://localhost:44385/api/Customer/Add`, JSON.stringify(customerDto)).pipe(
      map((data: any) => data),
      switchMap(data => {       
        return data;
      }),      
    )
  }
  /*

  createNewCustomer(customerDto : CustomerDto)
  {
    return this.http.post(`https://localhost:44385/api/Customer/Add`,customerDto);
   }
   */
}