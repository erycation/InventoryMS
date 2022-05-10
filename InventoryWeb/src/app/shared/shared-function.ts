import { Injectable } from "@angular/core";

@Injectable({
    providedIn: 'root'
})
export class SharedFunction {

    constructor() { }

    static checkUndefinedObjectValue(objectItem: any) {
        if (objectItem === undefined || objectItem === null || objectItem === 'null' || objectItem === '')
            return false;
        return true;
    }

    static numberOnly(event: { which: any; keyCode: any; }): boolean {
        const charCode = (event.which) ? event.which : event.keyCode;
        if (charCode > 31 && (charCode < 48 || charCode > 57)) {
            return false;
        }
        return true;
    }
}
