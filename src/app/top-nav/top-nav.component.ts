import { Component, OnInit } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';

declare var $: any;
@Component({
  selector: 'app-top-nav',
  templateUrl: './top-nav.component.html',
  styleUrls: ['./top-nav.component.css']
})
export class TopNavComponent implements OnInit {
  username: string;
  password: string;
  returned: any = { status: '', message: '' };

  constructor(private http: HttpClient) { }

  ngOnInit() {
  }
  signin(){
    $("#signin-modal").modal('show');
    const httpOptions = {
      headers: new HttpHeaders({
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
      })
    };
    var self = this;
    self.username = $("#username").val();
    self.password = $("#password").val();
    self.http.post(window['domain'] + '/api/signin/signin.php', {
      username: self.username,
      password: self.password,
    }, httpOptions).subscribe(
      res => {
        self.returned = res;
        $("#username").val('');
        $("#password").val('');
      },
      err => {
        console.log(err);
      }
    );
  }
}
