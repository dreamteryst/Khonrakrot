import { Component, OnInit, Input } from '@angular/core';
import { Observable } from '@firebase/util';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})
export class HeaderComponent implements OnInit {

  @Input() items: Observable<Object>;

  constructor() { }

  ngOnInit() {
  }

}
