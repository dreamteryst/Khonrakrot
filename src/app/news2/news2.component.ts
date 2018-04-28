import { Component, OnInit } from '@angular/core';
import { AngularFirestore } from 'angularfire2/firestore';
import { Observable } from 'rxjs/Observable';
import { HttpClient } from '@angular/common/http';
import { map } from 'rxjs/operators';

declare var jquery: any;
declare var $: any;

@Component({
  selector: 'app-news2',
  templateUrl: './news2.component.html',
  styleUrls: ['./news2.component.css']
})
export class News2Component implements OnInit {
  items: Observable<Object>;
  limit = 10;

  constructor(db: AngularFirestore, private http: HttpClient) {
    // this.items = db.collection('news', ref => ref.orderBy("date")).valueChanges();
  }

  ngOnInit() {
    $(function () {
      $("#btnLogin").show();
      $("#btnRegister").show();
    });
    this.items = this.http.get(window['domain'] + '/api/news/read.php')
      .share()
      .pipe(
        map(res => res['message']) // or any other operator
      );
  }

  more() {
    this.limit += 10;
  }

}
