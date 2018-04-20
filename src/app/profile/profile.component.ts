import { Component, OnInit } from '@angular/core';
import { map } from 'rxjs/operators';
import { Observable } from 'rxjs/Observable';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-profile',
  templateUrl: './profile.component.html',
  styleUrls: ['./profile.component.css']
})
export class ProfileComponent implements OnInit {
  items: Observable<Object>;

  constructor(private http: HttpClient) { }

  ngOnInit() {
    this.items = this.http.get(window['domain'] + '/api/fetch_user_profile.php')
      .share()
      .pipe(
        map(res => res['message']) // or any other operator
      );
      console.log("123456");
  }

}
