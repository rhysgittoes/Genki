

document.addEventListener('turbolinks:load', function(){
   AOS.init({
     duration: 1200,
   })
   
     $('#symptoms-input').selectize({
    plugins: ['restore_on_backspace', 'remove_button'],
    delimiter: ',',
    persist: false,
    placeholder: "Add a symptom...",
    create: function(input) {
      return {
        value: input,
        text: input
      }
    }
  })
    $('#referrals-input').selectize({
    plugins: ['restore_on_backspace', 'remove_button'],
    delimiter: ',',
    persist: false,
    placeholder: "Add a referral...",
    create: function(input) {
      return {
        value: input,
        text: input
      }
    }
  })
  
  
   
   $('#appointment-fields-toggle').click(function(){
       $('#appointment-fields-container').toggle()
       $(this).toggleClass("fa-angle-up fa-angle-down ")
   })
   
  $('#illness-fields-toggle').click(function(){
       $('#illness-fields-container').toggle()
       $(this).toggleClass("fa-angle-up fa-angle-down ")
   })
   
  $('#prescription-fields-toggle').click(function(){
       $('#prescription-fields-container').toggle()
       $(this).toggleClass("fa-angle-up fa-angle-down ")
   })
   
  $('#allergy-fields-toggle').click(function(){
       $('#allergy-fields-container').toggle()
       $(this).toggleClass("fa-angle-up fa-angle-down ")
   })
   
  $('#immunization-fields-toggle').click(function(){
       $('#immunization-fields-container').toggle()
       $(this).toggleClass("fa-angle-up fa-angle-down ")
   })

   
});