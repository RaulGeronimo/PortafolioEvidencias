import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';

//Principal
import { NavigationComponent } from './componentes/navigation/navigation.component';
import { FooterComponent } from './componentes/footer/footer.component';

//Inicio
import { InicioComponent } from './componentes/principal/inicio/inicio.component';
import { PresentacionComponent } from './componentes/principal/presentacion/presentacion.component';
import { SobremiComponent } from './componentes/principal/sobremi/sobremi.component';
import { ServiciosComponent } from './componentes/principal/servicios/servicios.component';
import { SkillsComponent } from './componentes/principal/skills/skills.component';
import { EducacionComponent } from './componentes/principal/educacion/educacion.component';
import { PortafolioComponent } from './componentes/principal/portafolio/portafolio.component';
import { ContactoComponent } from './componentes/principal/contacto/contacto.component';

//Proyectos
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

@NgModule({
  declarations: [
    AppComponent,
    AcademiaComponent,
    ContactoComponent,
    EducacionComponent,
    FooterComponent,
    HibernateComponent,
    InicioComponent,
    MongoNotesComponent,
    MongoTasksComponent,
    MusicaSpringComponent,
    NavigationComponent,
    PortafolioComponent,
    PresentacionComponent,
    RepertorioComponent,
    RestauranteComponent,
    SeriesComponent,
    ServiciosComponent,
    SkillsComponent,
    SobremiComponent,
    TiendaComponent,
    TransmisionDatosComponent,
    VideojuegosComponent,
    LinksComponent,
  ],
  imports: [BrowserModule, AppRoutingModule],
  providers: [],
  bootstrap: [AppComponent],
})
export class AppModule {}
