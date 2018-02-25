import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';


import { AppComponent } from './app.component';
import { NavbarComponent } from './navbar/navbar.component';
import { HeaderComponent } from './header/header.component';
import { FooterComponent } from './footer/footer.component';
import { MainComponent } from './main/main.component';
import { TopNavComponent } from './top-nav/top-nav.component';
import { NewsComponent } from './news/news.component';
import { AddNewsComponent } from './add-news/add-news.component';
import { ErrorComponent } from './error/error.component';

const appRoutes: Routes = [
  { 
    path: '', 
    component: MainComponent,
    children: [
      { path: '', component: NewsComponent },
      { path: 'home', component: NewsComponent },
      { path: 'addnews', component: AddNewsComponent }
    ]
  },
  { path: 'home',
    component: MainComponent
  },
  { path: '**', component: ErrorComponent }
];


@NgModule({
  declarations: [
    AppComponent,
    NavbarComponent,
    HeaderComponent,
    FooterComponent,
    MainComponent,
    TopNavComponent,
    NewsComponent,
    AddNewsComponent,
    ErrorComponent
  ],
  imports: [
    RouterModule.forRoot(
      appRoutes,
      { enableTracing: true } // <-- debugging purposes only
    ),
    BrowserModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
