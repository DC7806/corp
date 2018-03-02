$( document ).on('turbolinks:load', function() {
  $('#faq .faq-item a').on('click', function(event){
  $(this).children('i').toggleClass('down');
  $(this).siblings().fadeToggle(300);
  event.preventDefault();
  })
})