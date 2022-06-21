import { ComponentFixture, TestBed } from '@angular/core/testing';

import { StockTakingReportComponent } from './stock-taking-report.component';

describe('StockTakingReportComponent', () => {
  let component: StockTakingReportComponent;
  let fixture: ComponentFixture<StockTakingReportComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ StockTakingReportComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(StockTakingReportComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
