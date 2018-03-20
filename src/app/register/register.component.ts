import { Component, OnInit } from '@angular/core';
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
  name:String;
  people_id:String;
  copy:any;
  username:String;
  password:String;
  password_confirmation:String;
  birthday:String;
  email:String;
  agree:boolean;
  question1:String;
  question2:String;
  question3:String;
  answer1:String;
  answer2:String;
  answer3:String;

  constructor() {}

  ngOnInit() {
    $(function () {
      $("#birthday").datetimepicker({
        format: 'DD/MM/Y'
      });
    });
  }

  submit() {
    
  }

}
