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
  returned: any = { message: '' };
  token: string;
  // alert: string;
  isConfirm: boolean;

  constructor(private http: HttpClient) { }

  ngOnInit() {
    this.isConfirm = false;
  }
  signin() {
    var self = this;
    $("#signin-modal").modal('show');
    $("#modal-btn-yes").click(function () {
      if(!self.isConfirm){
        
        self.returned.message = "* กรุณายืนยันว่าท่านไม่ใช่โปรแกรมอัตโนมัติ *";
        return;
      }
      this.username = $("#username").val();
      this.password = $("#password").val();
      var formData = new FormData();
      formData.append('username', this.username);
      formData.append('password', this.password);
      self.http.post(window['domain'] + '/api/signin/signin.php', formData).subscribe(
        res => {
          self.returned = res;
          $("#username").val('');
          $("#password").val('');
        },
        err => {
          console.log(err);
        }
      );
    });

  }

  resolved(captchaResponse: string) {
    this.token = captchaResponse;
    this.isConfirm = true;
    console.log(`Resolved captcha with response ${captchaResponse}:`);
  }
}
