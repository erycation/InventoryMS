import { Injectable, Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'vendorpipe',
  // pure: false
})
@Injectable()
export class VendorPipe implements PipeTransform {
  transform(items: any[], param: string): any {
    // filter items array, items which match and return true will be kept, false will be filtered out

    if (param === '') {
      return items;
    }

    if (items) {
      return items.filter((item, index) => item.vendorName.toLowerCase().includes(param.toLowerCase()));
    }
  }
}
