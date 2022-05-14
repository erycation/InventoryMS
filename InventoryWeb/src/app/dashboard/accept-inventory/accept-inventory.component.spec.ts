import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AcceptInventoryComponent } from './accept-inventory.component';

describe('AcceptInventoryComponent', () => {
  let component: AcceptInventoryComponent;
  let fixture: ComponentFixture<AcceptInventoryComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AcceptInventoryComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(AcceptInventoryComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
