import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Observable } from 'rxjs/Observable';
import { map } from 'rxjs/operators';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-show-news',
  templateUrl: './show-news.component.html',
  styleUrls: ['./show-news.component.css']
})
export class ShowNewsComponent implements OnInit {
  id:number;
  item:any;
  topic:string;
  date_post:string;
  content:string;
  next:number;
  previous:number;
  isPrevious:boolean;

  constructor(private route: ActivatedRoute, private http: HttpClient, private router: Router) {}

  ngOnInit() {
    this.loadData();
  }
  
  nl2br (str, is_xhtml) {   
      var breakTag = (is_xhtml || typeof is_xhtml === 'undefined') ? '<br />' : '<br>';    
      return (str + '').replace(/([^>\r\n]?)(\r\n|\n\r|\r|\n)/g, '$1'+ breakTag +'$2');
  }

  loadData(){
    this.route.params.subscribe( params => {
      this.id = params.id;
    });
    // this.items = this.http.get(window['domain'] + '/api/news/read.php?id='+this.id)
    // .share()
    // .pipe(
    //   map(res => res['message']) // or any other operator
    // );
    this.http.get(window['domain'] + '/api/news/read.php?id='+this.id)
    .subscribe((res) => {
      this.item = res['message'][0];
      this.topic = this.item['topic'];
      this.content = this.item['content'];
      this.date_post = this.item['date_post'];
    });
    this.next = this.id*1 + 1*1;
    this.previous = this.id*1 - 1*1;
    
    this.isPrevious = !(this.previous < 1);
    console.log(this.next+" "+this.previous);
    
  }

  goPrevious(){
    this.router.navigate(['/show-news/' + this.previous])
    .then(() => {
      this.loadData();
    });
  }

  goNext(){
    this.router.navigate(['/show-news/' + this.next])
    .then(() => {
      this.loadData();
    });
  }
}
