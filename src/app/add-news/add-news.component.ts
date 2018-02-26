import { Component, OnInit } from '@angular/core';
declare var jquery:any;
declare var $ :any;

@Component({
  selector: 'app-add-news',
  templateUrl: './add-news.component.html',
  styleUrls: ['./add-news.component.css']
})
export class AddNewsComponent implements OnInit {

  constructor() { }

  ngOnInit() {
    window.dispatchEvent(new CustomEvent('initSummernote'));
    $(function(){
      $("#date").datetimepicker({
        format: 'DD/MM/Y'
      });
    });
  }

}
