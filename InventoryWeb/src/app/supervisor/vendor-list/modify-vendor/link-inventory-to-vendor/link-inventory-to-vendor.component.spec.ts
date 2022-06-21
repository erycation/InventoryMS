import { ComponentFixture, TestBed } from '@angular/core/testing';

import { LinkInventoryToVendorComponent } from './link-inventory-to-vendor.component';

describe('LinkInventoryToVendorComponent', () => {
  let component: LinkInventoryToVendorComponent;
  let fixture: ComponentFixture<LinkInventoryToVendorComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ LinkInventoryToVendorComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(LinkInventoryToVendorComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
