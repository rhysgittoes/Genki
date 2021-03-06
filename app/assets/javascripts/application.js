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
//= require selectize
//= require turbolinks
//= require_tree .
//= require cocoon




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

   $("#sign_up_btn").click(function(){
      $("#sign_up_modal").modal();
    });

   $("#sign_in_btn").click(function(){
      $("#sign_in_modal").modal();
    });

   $("#doctor_signup").click(function(event){
      event.preventDefault();
      if ($("#patient_hidden_form").css("display") == 'none') {
        $("#doctor_hidden_form").fadeToggle( "slow", "linear" );      
      } 
      else {
          $("#patient_hidden_form").css("display", "none"); 
          $("#doctor_hidden_form").fadeToggle( "slow", "linear" );
      }
   });

   $("#patient_signup").click(function(event){
          event.preventDefault();
          if ($("#doctor_hidden_form").css("display") == 'none') {
            $("#patient_hidden_form").fadeToggle( "slow", "linear" );
          } 
          else {
            $("#doctor_hidden_form").css("display", "none");
          $("#patient_hidden_form").fadeToggle( "slow", "linear" );
            }
   });

   $("#sign_in").click(function(event){
         event.preventDefault();
         $('#sign_in_form').attr('action', "/session");
         $("#sign_in_form").submit();

   })

});




 // $('#sign_up_basic').attr('action', "/patients");
         // $("#sign_up_basic").submit();

 // $('#sign_up_basic').attr('action', "/doctors");
      // $("#sign_up_basic").submit();




 // $(document).ready(function() {
 //        $(".move_to").on("click", function () {
 //            $('#sign_up_basic').attr('action', "/test1");
 //            $("#sign_up_basic").submit();
 //            e.preventDefault();
 //        });
 //    });