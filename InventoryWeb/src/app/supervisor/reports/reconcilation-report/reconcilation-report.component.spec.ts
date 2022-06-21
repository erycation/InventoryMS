import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ReconcilationReportComponent } from './reconcilation-report.component';

describe('ReconcilationReportComponent', () => {
  let component: ReconcilationReportComponent;
  let fixture: ComponentFixture<ReconcilationReportComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ReconcilationReportComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ReconcilationReportComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
