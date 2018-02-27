import { Component, OnInit } from '@angular/core';
declare var jquery: any;
declare var $: any;

@Component({
  selector: 'app-add-news',
  templateUrl: './add-news.component.html',
  styleUrls: ['./add-news.component.css']
})
export class AddNewsComponent implements OnInit {

  constructor() { }

  ngOnInit() {
    window.dispatchEvent(new CustomEvent('initSummernote'));
    $(function () {
      $("#date").datetimepicker({
        format: 'DD/MM/Y'
      });
      $('input[type=file]').change(function () {
        readURL(this);
      });

      function readURL(input) {

        if (input.files && input.files[0]) {
          var reader = new FileReader();
      
          reader.onload = function(e) {
            $("#cover_image").val(e.target['result']);
          }
      
          reader.readAsDataURL(input.files[0]);
        }
      }
    });
  }
  formConfirm(){
    $("#confirm-modal").modal('show');
    $("#modal-btn-yes").on("click", function(){
      $("#confirm-modal").modal('hide');
      $("#form_shipping").submit();
    });
    $("#modal-btn-no").on("click", function(){
      $("#confirm-modal").modal('hide');
    });
  }

}
