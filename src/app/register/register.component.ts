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
    {'label':'รถคันแรกของคุณ', 'value': 'รถคันแรกของคุณ'}, 
    {'label':'รถปัจจุบันของคุณ', 'value': 'รถปัจจุบันของคุณ'}, 
    {'label':'เพลงโปรดของคุณ', 'value': 'เพลงโปรดของคุณ'}, 
    {'label':'ชื่อโรงเรียนมัธยม', 'value': 'ชื่อโรงเรียนมัธยม'}
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
      this.error = 'กรุณาระบุ ชื่อ นามสกุล';
      this.isError = true;
    } else if (typeof this.people_id === 'undefined' || this.people_id == '') {
      this.error = 'กรุณาระบุ รหัสบัตรประชาชน / หมายเลขหนังสือเดินทาง';
      this.isError = true;
    } else if (typeof this.copy === 'undefined' || this.copy == '') {
      this.error = 'กรุณาระบุ สำเนาบัตรประชาชน / สำเนาหนังสือเดินทาง';
      this.isError = true;
    } else if (typeof this.username === 'undefined' || this.username == '') {
      this.error = 'กรุณาระบุ ชื่อผู้ใช้';
      this.isError = true;
    } else if (typeof this.password === 'undefined' || this.password == '') {
      this.error = 'กรุณาระบุ รหัสผ่าน';
      this.isError = true;
    } else if (typeof this.birthday === 'undefined' || this.birthday == '') {
      this.error = 'กรุณาระบุ วัน/เดือน/ปี';
      this.isError = true;
    } else if (typeof this.email === 'undefined' || this.email == '') {
      this.error = 'กรุณาระบุ อีเมล';
      this.isError = true;
    } else if (typeof this.question1 === 'undefined' || this.question1 == '') {
      this.error = 'กรุณาเลือก คำถามที่ 1';
      this.isError = true;
    } else if (typeof this.question2 === 'undefined' || this.question2 == '') {
      this.error = 'กรุณาเลือก คำถามที่ 2';
      this.isError = true;
    } else if (typeof this.question3 === 'undefined' || this.question3 == '') {
      this.error = 'กรุณาเลือก คำถามที่ 3';
      this.isError = true;
    } else if (typeof this.answer1 === 'undefined' || this.answer1 == '') {
      this.error = 'กรุณาระบุ คำตอบที่ 1';
      this.isError = true;
    } else if (typeof this.answer2 === 'undefined' || this.answer2 == '') {
      this.error = 'กรุณาระบุ คำตอบที่ 2';
      this.isError = true;
    } else if (typeof this.answer3 === 'undefined' || this.answer3 == '') {
      this.error = 'กรุณาระบุ คำตอบที่ 3';
      this.isError = true;
    } else if (!re.test(String(this.email).toLowerCase())) {
      this.error = 'กรุณาระบุ อีเมล ให้ถูกต้อง';
      this.isError = true;
    } else if (!this.birthday.match(/^(0[1-9]|[12][0-9]|3[01])[\- \/.](?:(0[1-9]|1[012])[\- \/.](201)[2-9]{1})$/)) {
      this.error = 'กรุณาระบุ วันเกิด ให้ถูกต้อง';
      this.isError = true;
    } else if (!this.people_id.match(/[0-9]{8,13}/g)) {
      this.error = 'กรุณาระบุ รหัสบัตรประชาชน / หมายเลขหนังสือเดินทาง ให้ถูกต้อง';
      this.isError = true;
    } else if (this.password != this.password_confirmation) {
      this.error = 'กรุณาระบุ รหัสผ่าน และ ยืนยันรหัสผ่าน ให้ตรงกัน';
      this.isError = true;
    } else if (this.question1 == this.question2 || this.question1 == this.question3 || this.question2 == this.question3) {
      this.error = 'กรุณาเลือกคำถาม ที่ไม่ซ้ำกัน';
      this.isError = true;
    } else if (!this.agree) {
      this.error = 'กรุณายอมรับข้อตกลง';
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
        this.router.navigate(['register-success']);
      }
    });
  }

}
