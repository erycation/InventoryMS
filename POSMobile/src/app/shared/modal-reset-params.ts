import { Router } from "@angular/router";
import { AuthToken } from "../Model/Dtos/loginDto/authToken";
import { AuthenticationService } from "../services/authentication.service";


export class ModalResetParams {

    user: AuthToken;
 
    constructor(private authenticationService: AuthenticationService) {
        this.user = this.authenticationService.userValue;
      
    }
}