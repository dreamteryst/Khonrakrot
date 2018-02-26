import { Component, OnInit } from '@angular/core';
import { AngularFirestore } from 'angularfire2/firestore';
import { Observable } from 'rxjs/Observable';
import { HttpClient } from '@angular/common/http';
import { map } from 'rxjs/operators';

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
    // this.items = this.http.get('http://localhost/api/news/read.php');
    this.items = this.http.get('http://10.199.66.227/SoftEn2018/Sec01_Flop/api/news/read.php').pipe(
      map(res => res['message']) // or any other operator
    );
  }

  more() {
    this.limit += 10;
  }

}
