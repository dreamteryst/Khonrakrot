import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AngularFireModule } from 'angularfire2';
import { AngularFirestoreModule } from 'angularfire2/firestore';
import { HttpClientModule } from '@angular/common/http';
import { FormsModule } from '@angular/forms';
import { environment } from '../environments/environment';


import { AppComponent } from './app.component';
import { NavbarComponent } from './navbar/navbar.component';
import { HeaderComponent } from './header/header.component';
import { FooterComponent } from './footer/footer.component';
import { MainComponent } from './main/main.component';
import { TopNavComponent } from './top-nav/top-nav.component';
import { NewsComponent } from './news/news.component';
import { AddNewsComponent } from './add-news/add-news.component';
import { ErrorComponent } from './error/error.component';
import { News2Component } from './news2/news2.component';
import { RegisterComponent } from './register/register.component';
import { RegisterSuccessComponent } from './register-success/register-success.component';
import { QuestionFilterPipe } from './question-filter.pipe';
import { ShowNewsComponent } from './show-news/show-news.component';

const appRoutes: Routes = [
  { 
    path: '', 
    component: MainComponent,
    children: [
      { path: '', component: News2Component },
      { path: 'home', component: News2Component },
      { path: 'addnews', component: AddNewsComponent },
      { path: 'register', component: RegisterComponent },
      { path: 'register-success', component: RegisterSuccessComponent },
      { path: 'show-news/:id', component: ShowNewsComponent }
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
    ErrorComponent,
    News2Component,
    RegisterComponent,
    RegisterSuccessComponent,
    QuestionFilterPipe,
    ShowNewsComponent
  ],
  imports: [
    RouterModule.forRoot(
      appRoutes,
      { enableTracing: true } // <-- debugging purposes only
    ),
    BrowserModule,
    AngularFireModule.initializeApp(environment.firebase),
    AngularFirestoreModule,
    HttpClientModule,
    FormsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
