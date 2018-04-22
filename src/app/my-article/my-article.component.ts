import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { map } from 'rxjs/operators';
import { Observable } from 'rxjs/Observable';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { $$ } from 'protractor';


declare var jquery: any;
declare var $: any;

@Component({
  selector: 'app-my-article',
  templateUrl: './my-article.component.html',
  styleUrls: ['./my-article.component.css']
})
export class MyArticleComponent implements OnInit {
  items: Observable<Object>;
  returned: any = {status:true, message: '' };

  constructor(private router: Router, private http: HttpClient) { }

  ngOnInit() {
    if (localStorage.getItem('loginSessId') == null) {
      this.router.navigate(['/']);
      return;
    }
    this.items = this.http.get(window['domain'] + '/api/article/read.php?username=' + localStorage.getItem('loginSessId'))
      .share()
      .pipe(
        map(res => res['message']) // or any other operator
      );
  }
  remove(id){
    var self = this;
    $('#del-article-modal').modal('show');
    $('#yes-remove').click(function(){
      self.http.get(window['domain'] + '/api/article/remove.php?id='+id).subscribe(
        res => {
          self.returned = res;
          if(res['status']){
            console.log(self.returned.message);
            $('#row-'+id).remove();
            $('#del-article-modal').modal('hide');
          }
        },
        err => {
          console.log(err);
        }
      );
      
    });
  }

}
