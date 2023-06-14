import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MongoTasksComponent } from './mongo-tasks.component';

describe('MongoTasksComponent', () => {
  let component: MongoTasksComponent;
  let fixture: ComponentFixture<MongoTasksComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ MongoTasksComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(MongoTasksComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
