import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ViewStockTakingComponent } from './view-stock-taking.component';

describe('ViewStockTakingComponent', () => {
  let component: ViewStockTakingComponent;
  let fixture: ComponentFixture<ViewStockTakingComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ViewStockTakingComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ViewStockTakingComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
