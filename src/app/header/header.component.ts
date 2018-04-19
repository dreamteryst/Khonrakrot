import { Component, OnInit, Input } from '@angular/core';
import { Observable } from 'rxjs/Observable';
import { HttpClient } from '@angular/common/http';
import { map } from 'rxjs/operators';
@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})
export class HeaderComponent implements OnInit {
  items: Observable<Object>;

  constructor(private http: HttpClient) { }

  ngOnInit() {
    this.items = this.http.get(window['domain'] + '/api/news/read.php?type=cover')
        .share()
        .pipe(
          map(res => res['message']) // or any other operator
        );
  }

}
