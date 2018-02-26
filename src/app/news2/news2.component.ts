import { Component, OnInit } from '@angular/core';
import { AngularFirestore } from 'angularfire2/firestore';
import { Observable } from 'rxjs/Observable';

@Component({
  selector: 'app-news2',
  templateUrl: './news2.component.html',
  styleUrls: ['./news2.component.css']
})
export class News2Component implements OnInit {
  items: Observable<any[]>;
  limit = 10;

  constructor(db: AngularFirestore) { 
    this.items = db.collection('news', ref => ref.orderBy("date")).valueChanges();
    // this.items = db.collection('news', ref => ref.orderBy("date").startAt({'key': "H4mh0ziSqu4gN3YnAruF"}).limit(10)).snapshotChanges().map( actions => {
    //   return actions.map(item => {
    //     return { id: item.payload.doc.id, ...item.payload.doc.data() }
    //   });
    // });
  }

  ngOnInit() {

  }

  more() {
    this.limit += 10;
  }

}
