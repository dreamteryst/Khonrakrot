import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.css']
})
export class NavbarComponent implements OnInit {

  isAdmin:boolean;
  isSignin: boolean;

  constructor(private router: Router) { }

  ngOnInit() {
    this.isAdmin = this.router.url == '/addnews';
    if(localStorage.getItem('loginSessId')!=null){
      this.isSignin = true;
    }
  }

}
