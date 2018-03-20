import { Component, OnInit } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Router } from '@angular/router';
declare var jquery: any;
declare var $: any;

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent implements OnInit {

  questions = [
    {'label':'What is your first car?', 'value': 'What is your first car?'}, 
    {'label':'What is your current car?', 'value': 'What is your current car?'}, 
    {'label':'What is your favorite song?', 'value': 'What is your favorite song?'}, 
    {'label':'What is your high school?', 'value': 'What is your high school?'}
  ];
  name:string;
  people_id:string;
  copy:any;
  username:string;
  password:string;
  password_confirmation:string;
  birthday:string;
  email:string;
  agree:string;
  question1:string;
  question2:string;
  question3:string;
  answer1:string;
  answer2:string;
  answer3:string;
  isError:boolean = false;
  error:string = '';

  constructor(private http:HttpClient, private router: Router) {}

  ngOnInit() {
    $(function () {
      $("#birthday").datetimepicker({
        format: 'DD/MM/Y'
      });
    });
  }

  handleFileInput(files: FileList) {
    this.copy = files.item(0);
  }

  submit() {
    this.birthday = $("#birthday").val();
    var re = /^(([^<>()\[\]\.,;:\s@\"]+(\.[^<>()\[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
    if (typeof this.name === 'undefined' || this.name == ''){
      this.error = 'Name Surname is require.';
      this.isError = true;
    } else if (typeof this.people_id === 'undefined' || this.people_id == '') {
      this.error = 'Citizen ID/Passport ID is require.';
      this.isError = true;
    } else if (typeof this.copy === 'undefined' || this.copy == '') {
      this.error = 'Copy of Citizen ID/Copy of Passport ID is require.';
      this.isError = true;
    } else if (typeof this.username === 'undefined' || this.username == '') {
      this.error = 'Username is require.';
      this.isError = true;
    } else if (typeof this.password === 'undefined' || this.password == '') {
      this.error = 'Password is require.';
      this.isError = true;
    } else if (typeof this.birthday === 'undefined' || this.birthday == '') {
      this.error = 'Date of birth is require.';
      this.isError = true;
    } else if (typeof this.email === 'undefined' || this.email == '') {
      this.error = 'Email is require.';
      this.isError = true;
    } else if (typeof this.question1 === 'undefined' || this.question1 == '') {
      this.error = 'Question 1 is require.';
      this.isError = true;
    } else if (typeof this.question2 === 'undefined' || this.question2 == '') {
      this.error = 'Question 2 is require.';
      this.isError = true;
    } else if (typeof this.question3 === 'undefined' || this.question3 == '') {
      this.error = 'Question 3 is require.';
      this.isError = true;
    } else if (typeof this.answer1 === 'undefined' || this.answer1 == '') {
      this.error = 'Answer 1 is require.';
      this.isError = true;
    } else if (typeof this.answer2 === 'undefined' || this.answer2 == '') {
      this.error = 'Answer 2 is require.';
      this.isError = true;
    } else if (typeof this.answer3 === 'undefined' || this.answer3 == '') {
      this.error = 'Answer 3 is require.';
      this.isError = true;
    } else if (!re.test(String(this.email).toLowerCase())) {
      this.error = 'Please re-enter email.';
      this.isError = true;
    } else if (!this.birthday.match(/^(0[1-9]|[12][0-9]|3[01])[\- \/.](?:(0[1-9]|1[012])[\- \/.][1-2]{1}[0-9]{3})$/)) {
      this.error = 'Please re-enter date of birth.';
      this.isError = true;
    } else if (!this.people_id.match(/[0-9]{8,13}/g)) {
      this.error = 'Please re-enter Citizen ID/Passport ID.';
      this.isError = true;
    } else if (this.password != this.password_confirmation) {
      this.error = 'Password do not match confirm password.';
      this.isError = true;
    } else if (this.question1 == this.question2 || this.question1 == this.question3 || this.question2 == this.question3) {
      this.error = 'Please select a uniqe question.';
      this.isError = true;
    } else if (!this.agree) {
      this.error = 'Please agree term and condition.';
      this.isError = true;
    } else {
      this.isError = false;
    }

    if(this.isError) {
      return;
    }
    var formData = new FormData();
    formData.append('name', this.name);
    formData.append('people_id', this.people_id);
    formData.append('copy', this.copy, this.copy.name);
    formData.append('username', this.username);
    formData.append('password', this.password);
    formData.append('birthday', this.birthday);
    formData.append('email', this.email);
    formData.append('question1', this.question1);
    formData.append('question2', this.question2);
    formData.append('question3', this.question3);
    formData.append('answer1', this.answer1);
    formData.append('answer2', this.answer2);
    formData.append('answer3', this.answer3);

    this.http.post(window['domain'] + '/api/register/insert.php', formData).subscribe(res => {
      if(res['status']) {
        this.router.navigate(['/register-success']);
      }
    });
  }

}
