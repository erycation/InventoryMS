import { Router } from "@angular/router";
import { AuthToken } from "../model/loginDto/authToken";
import { AccountService } from "../service/account.service";

export class ModalResetParams {

    user: AuthToken;
 
    constructor(private accountService: AccountService,
        private router: Router) {
        this.user = this.accountService.userValue;
      
        this.resetValidationFields();
    }

    public goToPageNoParams(pageName : string) : void  {
        this.router.navigate([pageName]);
    }

    public goToPageOneParams(pageName : string, param1 : any) : void  {
        this.router.navigate([pageName,param1]);
    }

    public goToPageTwoParams(pageName : string, param1 : any, param2 : any) : void {
        this.router.navigate([pageName,param1,param2]);
    }

    public goToPageThreeParams(pageName : string, param1 : any, param2 : any, param3 : any) : void {
        this.router.navigate([pageName,param1,param2,param3]);
    }

    public goToPageFourParams(pageName : string, param1 : any, param2 : any, param3 : any, param4 : any) : void {
        this.router.navigate([pageName,param1,param2,param3,param4]);
    }

    public resetValidationFields(): void {
    } 
}