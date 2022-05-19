import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from 'src/environments/environment';
import { InventoryDto } from '../Model/Dtos/inventoryDto';


 
@Injectable({
  providedIn: 'root'
})
export class InventoryService {
 
  constructor(private http: HttpClient) {
   
  }

  getAllInventories() {
      return this.http.get<InventoryDto[]>(`${environment.urlApi}Inventory/GetAll`);
  }
}