import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from 'src/environments/environment';
import { InventoryToOrderDto } from '../Model/Dtos/inventoryToOrderDto';

 
@Injectable({
  providedIn: 'root'
})
export class InventoryService {
 
  constructor(private http: HttpClient) {
   
  }

  getAllInventoriesToOrder() {
      return this.http.get<InventoryToOrderDto[]>(`${environment.urlApi}Inventory/GetAll/ToOrder`);
  }
}