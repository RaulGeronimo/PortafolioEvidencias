import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

//Componentes
import { InicioComponent } from './componentes/principal/inicio/inicio.component';
import { TransmisionDatosComponent } from './componentes/projects/transmision-datos/transmision-datos.component';
import { RestauranteComponent } from './componentes/projects/restaurante/restaurante.component';
import { HibernateComponent } from './componentes/projects/hibernate/hibernate.component';
import { MusicaSpringComponent } from './componentes/projects/musica-spring/musica-spring.component';
import { TiendaComponent } from './componentes/projects/tienda/tienda.component';
import { AcademiaComponent } from './componentes/projects/academia/academia.component';
import { SeriesComponent } from './componentes/projects/series/series.component';
import { VideojuegosComponent } from './componentes/projects/videojuegos/videojuegos.component';
import { RepertorioComponent } from './componentes/projects/repertorio/repertorio.component';
import { MongoTasksComponent } from './componentes/projects/mongo-tasks/mongo-tasks.component';
import { MongoNotesComponent } from './componentes/projects/mongo-notes/mongo-notes.component';
import { LinksComponent } from './componentes/projects/links/links.component';

const routes: Routes = [
  //Creacion de Objetos

  //Index
  {
    path: '',
    redirectTo: '/inicio',
    pathMatch: 'full',
  },
  {
    path: 'inicio',
    component: InicioComponent,
  },
  //Transmision Datos
  {
    path: 'datos',
    component: TransmisionDatosComponent,
  },
  //Restaurante PHP
  {
    path: 'restaurante',
    component: RestauranteComponent,
  },
  //Musica Hibernate
  {
    path: 'hibernate',
    component: HibernateComponent,
  },
  //Musica Spring
  {
    path: 'musica',
    component: MusicaSpringComponent,
  },
  //Tienda Angular
  {
    path: 'tienda',
    component: TiendaComponent,
  },
  //Academia Angular
  {
    path: 'academia',
    component: AcademiaComponent,
  },
  //Series Spring
  {
    path: 'series',
    component: SeriesComponent,
  },
  //Videojuegos
  {
    path: 'videojuegos',
    component: VideojuegosComponent,
  },
  //Repertorio Angular
  {
    path: 'repertorio',
    component: RepertorioComponent,
  },
  //Tareas Mongo
  {
    path: 'tareas',
    component: MongoTasksComponent,
  },
  //Notas Mongo
  {
    path: 'notas',
    component: MongoNotesComponent,
  },
  //Aplicaion MySQL
  {
    path: 'links',
    component: LinksComponent,
  },
  /* Pagina no existente */
  {
    path: '**',
    redirectTo: '/inicio',
    pathMatch: 'full',
  },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
