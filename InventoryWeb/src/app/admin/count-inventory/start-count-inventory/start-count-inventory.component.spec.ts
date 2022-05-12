import { ComponentFixture, TestBed } from '@angular/core/testing';

import { StartCountInventoryComponent } from './start-count-inventory.component';

describe('StartCountInventoryComponent', () => {
  let component: StartCountInventoryComponent;
  let fixture: ComponentFixture<StartCountInventoryComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ StartCountInventoryComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(StartCountInventoryComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
