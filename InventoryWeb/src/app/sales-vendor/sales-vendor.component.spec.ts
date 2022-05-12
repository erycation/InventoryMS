import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SalesVendorComponent } from './sales-vendor.component';

describe('SalesVendorComponent', () => {
  let component: SalesVendorComponent;
  let fixture: ComponentFixture<SalesVendorComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ SalesVendorComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(SalesVendorComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
