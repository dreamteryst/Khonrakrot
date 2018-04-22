import { Component, OnInit } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { ActivatedRoute, Router } from '@angular/router';

declare var jquery: any;
declare var $: any;

@Component({
  selector: 'app-edit-article',
  templateUrl: './edit-article.component.html',
  styleUrls: ['./edit-article.component.css']
})
export class EditArticleComponent implements OnInit {
  topic: String;
  content: String;
  date: String;
  status: number;
  category: number;
  returned: any = { status: '', message: '' };
  id: number;
  constructor(private http: HttpClient, private route: ActivatedRoute, private router: Router) { }

  ngOnInit() {
    $('#summernote').summernote({
      height: 500
    });
    this.route.params.subscribe( params => {
      this.id = params.id;
    });
    this.http.get(window['domain'] + '/api/article/read.php?username=' + localStorage.getItem('loginSessId') + '&id='+this.id)
    .subscribe(data => {
     data = data['message'][0];

     $('#topic').val(data['topic']);
     $('#summernote').summernote('code', data['content']);
    //  console.log(data['content']);
     $('#status').val(data['status']);
     $('#date').val(data['date']);
     $('#category').val(data['category']);
     
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
    self.content = $('#summernote').summernote('code');
    self.status = $("#status").val();
    self.category = $("#category").val();
    // console.log(self.topic);
    // console.log(self.date);
    // console.log(self.content);
    // console.log(self.status);
    // console.log(self.category);
    // console.log(localStorage.getItem('loginSessId'));
    // console.log(this.id);
    self.http.post(window['domain'] + '/api/article/edit.php', {
      username: localStorage.getItem('loginSessId'),
      topic: self.topic,
      content: self.content,
      status: self.status,
      date: self.date,
      category: self.category,
      id_article: this.id
    }, httpOptions).subscribe(
      res => {
        self.returned = res;
        if(res['status']){
          this.router.navigate(['/my-article']);
        }
      },
      err => {
        console.log(err);
      }
    );
  }

}
