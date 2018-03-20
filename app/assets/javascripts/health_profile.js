document.addEventListener('turbolinks:load', function(){

   $("#new_apoint_button").click(function(event){
      if($("#appoitments_form_HP").css("display") == "none"){
         $("#appoitments_list_HP").fadeToggle("slow","linear");
         $("#appoitments_form_HP").delay(700).fadeToggle("slow","linear");
         console.log("HELLO")
      }
      else{
         $("#appoitments_form_HP").fadeToggle("slow","linear");
         $("#appoitments_list_HP").delay(700).fadeToggle("slow","linear");
      }


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


 // appoitments_form_HP


 // appoitments_list_HP