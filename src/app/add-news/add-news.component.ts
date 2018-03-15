import { Component, OnInit } from '@angular/core';
import { Observable } from 'rxjs/Observable';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { map } from 'rxjs/operators';
declare var jquery: any;
declare var $: any;

@Component({
  selector: 'app-add-news',
  templateUrl: './add-news.component.html',
  styleUrls: ['./add-news.component.css']
})
export class AddNewsComponent implements OnInit {

  topic: String;
  content: String;
  date: String;
  cover: String;

  returned: any = { status: '', message: '' };

  constructor(private http: HttpClient) { }

  ngOnInit() {
    $(function () {
      $('#summernote').summernote({
        height: 500
      });
      $("#date").datetimepicker({
        format: 'DD/MM/Y'
      });
      $('input[type=file]').change(function () {
        readURL(this);
      });

      function readURL(input) {

        if (input.files && input.files[0]) {
          var reader = new FileReader();

          reader.onload = function (e) {
            $("#cover_image").val(e.target['result']);
          }

          reader.readAsDataURL(input.files[0]);
        }
      }
    });
  }
  formConfirm() {
    const httpOptions = {
      headers: new HttpHeaders({
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
      })
    };
    var self = this;
    $("#confirm-modal").modal('show');
    $("#modal-btn-yes").on("click", function () {
      self.topic = $("#topic").val();
      self.date = $("#date").val();
      self.content = $('#summernote').val();
      self.cover = $("#cover_image").val();
      $("#confirm-modal").modal('hide');
      self.http.post(window['domain'] + '/api/news/insert.php', {
        topic: self.topic,
        content: self.content,
        cover_image: self.cover,
        date_post: self.date
      }, httpOptions).subscribe(
        res => {
          self.returned = res;
          $("#topic").val('');
          $("#date").val('');
          $('#summernote').summernote('code', '');
          $("#cover_image").val('');
        },
        err => {
          console.log(err);
        }
      );
      // $("#form_shipping").submit();
    });
    $("#modal-btn-no").on("click", function () {
      $("#confirm-modal").modal('hide');
    });
  }

}
