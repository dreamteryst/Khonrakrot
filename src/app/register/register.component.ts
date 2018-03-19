import { Component, OnInit } from '@angular/core';

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
  question1:String;
  question2:String;
  question3:String;
  answer1:String;
  answer2:String;
  answer3:String;

  constructor() {}

  ngOnInit() {
  }

}
