import { Component, OnInit } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';

declare var jquery: any;
declare var $: any;

@Component({
  selector: 'app-add-article',
  templateUrl: './add-article.component.html',
  styleUrls: ['./add-article.component.css']
})
export class AddArticleComponent implements OnInit {
  topic: String;
  content: String;
  date: String;
  status: number;
  category: number;
  returned: any = { status: '', message: '' };

  constructor(private http: HttpClient) { }

  ngOnInit() {
    $('#summernote').summernote({
      height: 500
    });
  }
  formConfirm() {
    const httpOptions = {
      headers: new HttpHeaders({
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
      })
    };
    var self = this;
    self.topic = $("#topic").val();
    self.date = $("#date").val();
    self.content = $('#summernote').val();
    self.status = $("#status").val();
    self.category = $("#category").val();
    self.http.post(window['domain'] + '/api/article/insert.php', {
      username: localStorage.getItem('loginSessId'),
      topic: self.topic,
      content: self.content,
      status: self.status,
      date: self.date,
      category: self.category
    }, httpOptions).subscribe(
      res => {
        self.returned = res;
        if(res['status']){
          $("#topic").val('');
          $("#date").val('');
          $('#summernote').summernote('code', '');
        }
      },
      err => {
        console.log(err);
      }
    );
  }

}
