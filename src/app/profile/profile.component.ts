import { Component, OnInit } from '@angular/core';
import { map } from 'rxjs/operators';
import { Observable } from 'rxjs/Observable';
import { HttpClient } from '@angular/common/http';

declare var jquery: any;
declare var $: any;

@Component({
  selector: 'app-profile',
  templateUrl: './profile.component.html',
  styleUrls: ['./profile.component.css']
})
export class ProfileComponent implements OnInit {
  name:string;
  people_id:string;
  username:string;
  password:string;
  date_of_Birth:string;
  email:string;
  question_1:string;
  question_2:string;
  question_3:string;
  answer_1:string;
  answer_2:string;
  answer_3:string;
  constructor(private http: HttpClient) { }

  ngOnInit() {
    this.http.get(window['domain'] + '/api/fetch_user_profile.php?username=' + localStorage.getItem('loginSessId'))
    .subscribe(data => {
      this.name = data['message'][0]['name'];
      this.people_id = data['message'][0]['people_id'];
      this.username = data['message'][0]['username'];
      this.date_of_Birth = data['message'][0]['date_of_Birth'];
      this.email = data['message'][0]['email'];
      this.question_1 = data['message'][0]['question_1'];
      this.question_2 = data['message'][0]['question_2'];
      this.question_3 = data['message'][0]['question_3'];
      this.answer_1 = data['message'][0]['answer_1'];
      this.answer_2 = data['message'][0]['answer_2'];
      this.answer_3 = data['message'][0]['answer_3'];
    });
  }
  
}
