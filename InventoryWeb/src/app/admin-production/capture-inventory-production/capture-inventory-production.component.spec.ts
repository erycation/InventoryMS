import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CaptureInventoryProductionComponent } from './capture-inventory-production.component';

describe('CaptureInventoryProductionComponent', () => {
  let component: CaptureInventoryProductionComponent;
  let fixture: ComponentFixture<CaptureInventoryProductionComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CaptureInventoryProductionComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(CaptureInventoryProductionComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
