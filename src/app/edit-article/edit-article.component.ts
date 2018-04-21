import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-edit-article',
  templateUrl: './edit-article.component.html',
  styleUrls: ['./edit-article.component.css']
})
export class EditArticleComponent implements OnInit {
  topic: String;
  content: String;
  date: String;
  status: number;
  category: number;
  returned: any = { status: '', message: '' };
  constructor() { }

  ngOnInit() {
  }

}
