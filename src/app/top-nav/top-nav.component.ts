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
  returned: any = {status:true, message: '' };
  token: string;
  isConfirm: boolean;
  isSignin: boolean;
  user: string;

  constructor(private http: HttpClient) { }

  ngOnInit() {
    this.isConfirm = false;
    if(localStorage.getItem('loginSessId')==null){
      this.isSignin = false;
    }else{
      this.user = localStorage.getItem('loginSessId');
      this.isSignin = true;
    }
  }
  signin() {
    var self = this;
    $("#signin-modal").modal('show');
    $("#modal-btn-yes").click(function () {
      if(!self.isConfirm){
        self.returned.status = false;
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
          if(res['status']){
            localStorage.setItem('loginSessId',  this.username);
            window.location.reload();
          }
        },
        err => {
          console.log(err);
        }
      );
    });

  }
  
  signout(){
    localStorage.clear();
    window.location.reload();
  }

  resolved(captchaResponse: string) {
    this.token = captchaResponse;
    this.isConfirm = true;
    console.log(`Resolved captcha with response ${captchaResponse}:`);
  }
}
