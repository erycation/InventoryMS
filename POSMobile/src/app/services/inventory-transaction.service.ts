import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from 'src/environments/environment';
import { InventoryTransactionDto } from '../Model/Dtos/inventoryTransactionDto';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class InventoryTransactionService {
 
  constructor(private http: HttpClient) {   
  }

  getAwaitingInventoriesToAccepted(vendorId: string) {
      return this.http.get<InventoryTransactionDto[]>(`${environment.urlApi}InventoryTransaction/Awaiting/Accepted/${vendorId}`);
  }

  acceptInventoryInBranch(inventoryTransactionDto : InventoryTransactionDto[], vendorId: string, userId:string): Observable<any> {    
    return this.http.post(`${environment.urlApi}InventoryTransaction/Accept/Vendor/${vendorId}/${userId}`, inventoryTransactionDto)
  }
}