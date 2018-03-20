document.addEventListener('turbolinks:load', function(){

   $("#new_apoint_button").click(function(event){
      console.log("HewoHewo")
   })
});


// $("#doctor_signup").click(function(event){
//       event.preventDefault();
//       if ($("#patient_hidden_form").css("display") == 'none') {
//         $("#doctor_hidden_form").fadeToggle( "slow", "linear" );      
//       } 
//       else {
//           $("#patient_hidden_form").css("display", "none"); 
//           $("#doctor_hidden_form").fadeToggle( "slow", "linear" );
//       }