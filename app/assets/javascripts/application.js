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
//= require rails-ujs
//= require turbolinks
//= require_tree .


// document.addEventListener('turbolinks:load', function(){
//   // $("#laptop").hide();
//    $(".hewothere").click(function () {
//       // $("#laptop").hide();
//       console.log("hello there.")
//       $("#Awesome").animate({
//          left: '500px'
//       }, 1000, function() {
//        // Animation complete.
//       });
//    });
// });

document.addEventListener('turbolinks:load', function(){
   AOS.init({
     duration: 1200,
   })

      $("#myBtn").click(function(){
        $("#myModal").modal();
    });

      $("#doctor_signup").click(function(event){
             event.preventDefault();
            $('#sign_up_basic').attr('action', "/doctors");
            $('#sign_up_basic').attr('namespace', ":doctors");

            $("#sign_up_basic").submit();
      });

      $("#patient_signup").click(function(event){
             event.preventDefault();
      });


});




 // $(document).ready(function() {
 //        $(".move_to").on("click", function () {
 //            $('#sign_up_basic').attr('action', "/test1");
 //            $("#sign_up_basic").submit();
 //            e.preventDefault();
 //        });
 //    });