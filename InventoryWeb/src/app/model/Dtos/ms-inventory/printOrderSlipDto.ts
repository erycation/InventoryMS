import { CustomerOrderItemToBePlacedDto } from "./customerOrderItemToBePlacedDto";

export interface printOrderSlipDto  {
    customerFirstName: string;
    customerSurname: string;
    totalOrderPrice: number;
    totalQuantityToOrder: number;
    customerOrderItemToBePlacedDto?: CustomerOrderItemToBePlacedDto[] | undefined;
}
