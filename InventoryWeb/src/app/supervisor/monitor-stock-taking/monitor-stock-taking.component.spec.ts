import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MonitorStockTakingComponent } from './monitor-stock-taking.component';

describe('MonitorStockTakingComponent', () => {
  let component: MonitorStockTakingComponent;
  let fixture: ComponentFixture<MonitorStockTakingComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ MonitorStockTakingComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(MonitorStockTakingComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
