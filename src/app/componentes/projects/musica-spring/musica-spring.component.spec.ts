import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MusicaSpringComponent } from './musica-spring.component';

describe('MusicaSpringComponent', () => {
  let component: MusicaSpringComponent;
  let fixture: ComponentFixture<MusicaSpringComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ MusicaSpringComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(MusicaSpringComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
