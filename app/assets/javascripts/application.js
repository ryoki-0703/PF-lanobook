// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

/*global $*/

document.addEventListener("turbolinks:load"
, function () {
  $(function() {
    console.log("hoge");
    $(".full-screen").slick({
      //centerMode: true,
      centerPadding: '5%',
      dots: true,
      autoplay: true,
      autoplaySpeed: 3000,
      speed: 1000,
      infinite: true,
      pauseOnFocus: false,
      slidesToShow: 3,
      slidesToScroll: 1
    });
  });

  $("lanobe-gazou").ready(
  function(){
    $("a img") .hover(function(){
       $(this).fadeTo("0.01",0.3); // マウスオーバーで透明度を30%にする
    },function(){
       $(this).fadeTo("0.1",1.0); // マウスアウトで透明度を100%に戻す
    });
  });

  $('#lanobe_image').on('change', function (e) {
    var reader = new FileReader();
    reader.onload = function (e) {
        $("#preview").attr('src', e.target.result);
    };
    reader.readAsDataURL(e.target.files[0]);
  });

});



