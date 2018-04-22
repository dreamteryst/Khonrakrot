import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { HttpClient } from '@angular/common/http';

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

  constructor(private route: ActivatedRoute, private http: HttpClient) { }

  ngOnInit() {
    this.username = localStorage.getItem('loginSessId');
    this.route.params.subscribe( params => {
      this.id = params.id;
    });

    this.http.get(window['domain'] + '/api/article/read.php?username='+ this.username +'&id='+this.id)
    .subscribe((res) => {
      this.topic = res['message']['0']['topic'];
      this.content = res['message']['0']['content'];
      this.date = res['message']['0']['date'];
    });

    const self = this;
    $('textarea').keyup(function(){
      self.length = $(this).val().length;
    });
  }

}
