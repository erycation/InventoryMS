import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AdminProductionComponent } from './admin-production.component';

describe('AdminProductionComponent', () => {
  let component: AdminProductionComponent;
  let fixture: ComponentFixture<AdminProductionComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AdminProductionComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(AdminProductionComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
