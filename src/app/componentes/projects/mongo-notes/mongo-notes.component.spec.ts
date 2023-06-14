import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MongoNotesComponent } from './mongo-notes.component';

describe('MongoNotesComponent', () => {
  let component: MongoNotesComponent;
  let fixture: ComponentFixture<MongoNotesComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ MongoNotesComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(MongoNotesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
