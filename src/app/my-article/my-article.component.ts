import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { map } from 'rxjs/operators';
import { Observable } from 'rxjs/Observable';
import { HttpClient, HttpHeaders } from '@angular/common/http';


declare var jquery: any;
declare var $: any;

@Component({
  selector: 'app-my-article',
  templateUrl: './my-article.component.html',
  styleUrls: ['./my-article.component.css']
})
export class MyArticleComponent implements OnInit {

  constructor(private router: Router, private http: HttpClient) { }

  ngOnInit() {
    if (localStorage.getItem('loginSessId') == null) {
      this.router.navigate(['/']);
      return;
    }
    this.http.get(window['domain'] + '/api/article/read.php?username=' + localStorage.getItem('loginSessId'))
      .subscribe(data => {
        console.log(data);
      });
  }

}
