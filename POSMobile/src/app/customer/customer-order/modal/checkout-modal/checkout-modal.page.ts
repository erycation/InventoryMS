import { Component, Input, OnInit } from '@angular/core';
import { ModalController } from '@ionic/angular';
import { InventoryToOrderDto } from 'src/app/Model/Dtos/inventoryToOrderDto';

@Component({
  selector: 'app-checkout-modal',
  templateUrl: './checkout-modal.page.html',
  styleUrls: ['./checkout-modal.page.scss'],
})
export class CheckoutModalPage implements OnInit {

  @Input() public inventoriesToInCart: InventoryToOrderDto[];
  //inventoriesToInCartDto: InventoryToOrderDto[];
  constructor(private modalCtrl: ModalController) { }

  async ngOnInit() {
  }

  dismiss(): void {
    this.modalCtrl.dismiss();
  }

}
