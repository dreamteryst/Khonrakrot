import { Component, OnInit } from '@angular/core';
import { Observable } from 'rxjs/Observable';
import { map } from 'rxjs/operators';
import { ActivatedRoute, Router } from '@angular/router';
import { HttpClient, HttpHeaders } from '@angular/common/http';

declare var jquery: any;
declare var $: any;

@Component({
  selector: 'app-show-article',
  templateUrl: './show-article.component.html',
  styleUrls: ['./show-article.component.css']
})
export class ShowArticleComponent implements OnInit {
  id:number;
  topic:string;
  content:string;
  date:string;
  username:string;
  length:number = 0;
  comment:string;
  items: Observable<Object>;
  

  constructor(private route: ActivatedRoute, private http: HttpClient) { }

  ngOnInit() {
    this.username = localStorage.getItem('loginSessId');
    this.route.params.subscribe(params => {
      this.id = params.id;
    });

    this.http.get(window['domain'] + '/api/article/read.php?username=' + this.username + '&id=' + this.id)
      .subscribe((res) => {
        this.topic = res['message']['0']['topic'];
        this.content = res['message']['0']['content'];
        this.date = res['message']['0']['date'];
      });
      
    this.items = this.http.get(window['domain'] + '/api/comment/read.php?id=' + this.id)
      .share()
      .pipe(
        map(res => res['message']) // or any other operator
      );

    const self = this;
    $('textarea').keyup(function () {
      self.length = $(this).val().length;
    });
  }

  submit() {
    if($("#comment").val().length <= 0) {
      return;
    }
    const httpOptions = {
      headers: new HttpHeaders({
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
      })
    };
    this.http.post(window['domain'] + '/api/comment/insert.php?id='+this.id, {
      username: localStorage.getItem('loginSessId'),
      id_article: this.id,
      message: $("#comment").val()
    }, httpOptions).subscribe(
      res => {
        console.log(res);
        if(res['status']){
          var data = "";
          data += '<div _ngcontent-c4 class="col-md-12" style="word-wrap: break-word;">';
          data +=   '<div _ngcontent-c4 class="text-comment">';
          data +=     $("#comment").val();
          data +=   '</div>';
          data +=   '<div _ngcontent-c4 class="row">';
          data +=     '<span _ngcontent-c4 class="pull-right">โดย<strong>'+localStorage.getItem('loginSessId')+'</strong> เมื่อวันที่ '+res['date']+'</span>';
          data +=   '</div>'
          data += '</div>';
          $("#comment").val("");
          $('#div-comment').append(data);
        }
      },
      err => {
        console.log(err);
      }
    );

  }

}
