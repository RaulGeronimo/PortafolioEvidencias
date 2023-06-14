import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TransmisionDatosComponent } from './transmision-datos.component';

describe('TransmisionDatosComponent', () => {
  let component: TransmisionDatosComponent;
  let fixture: ComponentFixture<TransmisionDatosComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ TransmisionDatosComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(TransmisionDatosComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
