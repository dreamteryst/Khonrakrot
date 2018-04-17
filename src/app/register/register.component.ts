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
      // $("#birthday").datetimepicker({
      //   format: 'DD/MM/Y'
      // });
    });
  }

  handleFileInput(files: FileList) {
    this.copy = files.item(0);
  }

  check_idcard(idcard){
    if(idcard.value == ""){ return false;}
    if(idcard.length < 13){ return false;}
    if(idcard.length > 13){ return false;}
  
  let num = this.str_split(idcard, 1); // function เพิ่มเติม
  let sum = 0;
  let total = 0;
  let digi = 13;
  
    for(let i=0;i<12;i++){
      sum = sum + (num[i] * digi);
      digi--;
    }
    total = ((11 - (sum % 11)) % 10);
    
    if(total == num[12]){ //	alert('รหัสหมายเลขประจำตัวประชาชนถูกต้อง');
      return true;
    }else{ //	alert('รหัสหมายเลขประจำตัวประชาชนไม่ถูกต้อง');
      return false;
    }
  }
  
  
  str_split ( f_string, f_split_length){
      f_string += '';
      if (f_split_length == undefined) {
          f_split_length = 1;
      }
      if(f_split_length > 0){
          var result = [];
          while(f_string.length > f_split_length) {
              result[result.length] = f_string.substring(0, f_split_length);
              f_string = f_string.substring(f_split_length);
          }
          result[result.length] = f_string;
          return result;
      }
      return false;
  }

  submit() {
    this.birthday = $("#birthday").val();
    // password : length [a-zA-Z0-9-_]{16,}
    var age = 2018 - parseInt(this.birthday.split('/')[2]);
    var re = /^(([^<>()\[\]\.,;:\s@\"]+(\.[^<>()\[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
    const rePassport = /^([a-zA-Z]{2}[0-9]{6})$/i;
    const rePassword = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[-_])[A-Za-z\d-_]{16,}$/i;
    const reName =  /^((\S+) (\S+))$/i;
    const reUsername = /^([a-zA-Z0-9]{1,200})$/i;
    
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
    } else if (this.people_id.length >= 13) {
      if (!this.check_idcard(this.people_id)) {
        this.error = 'Please re-enter Citizen ID/Passport ID.';
        this.isError = true;
      }
    } else if (this.people_id.length >= 8) {
      if(!rePassport.test(this.people_id)) {
        this.error = 'Please re-enter Citizen ID/Passport ID.';
        this.isError = true;
      }
    } else if(this.people_id.length < 8) {
      this.error = 'Please re-enter Citizen ID/Passport ID.';
      this.isError = true;
    } else if (!reName.test(this.name)) {
      this.error = 'Please re-enter Name Surname.';
      this.isError = true;
    } else if (!reUsername.test(this.username)) {
      this.error = 'Please re-enter Username.';
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
    } else if (age < 20) {
      this.error = 'Please re-enter date of birth.';
      this.isError = true;
    } else if (!rePassword.test(this.password)) {
      this.error = 'Minimum 16 characters, at least one uppercase letter, one lowercase letter and one number';
      this.isError = true;
    } else if(parseInt(this.birthday.split('/')[2]) < 1970) {
      this.error = 'Please re-enter date of birth.';
      this.isError = true;
    } else if(parseInt(this.birthday.split('/')[1]) == 2 && parseInt(this.birthday.split('/')[0]) > 29) {
      this.error = 'Please re-enter date of birth.';
      this.isError = true;
    } else if(this.copy.type != 'image/png' || this.copy.type != 'image/jpeg' || this.copy.type != 'image/gif' || this.copy.type != 'application/pdf') {
      this.error = 'Please enter image or pdf format';
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
      // console.log(res);
      if(res['status']) {
        this.router.navigate(['/register-success']);
      } else {
        this.error = res['message'];
        this.isError = true;
      }
    });
  }

}
