import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
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
  constructor(private http: HttpClient, private route: ActivatedRoute) { }

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

}
