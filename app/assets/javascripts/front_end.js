$( document ).on('turbolinks:load', function() {
  $('#faq .faq-item a').on('click', function(event){
  $(this).children('i').toggleClass('down');
  $(this).siblings().fadeToggle(300);
  event.preventDefault();
  })
})

// $( document ).on('turbolinks:load', function() {
//   $('.dropdown-rotate').on('click', function(event){
//   $(this).children('i').toggleClass('down');
//   $(this).siblings().toggleClass('active');
//   event.preventDefault();
//   })
// })


$( document ).on('turbolinks:load', function() {
	$('.dropdown-rotate').on('click', function(event){
    $(this).children('i').toggleClass('down');
    
    $(this).next().removeClass('hidden-xs');
    $(this).next().addClass('active in');
    $(this).siblings('a').children('i').removeClass('down');
    $(this).next().siblings('div').addClass('hidden-xs');


    event.preventDefault();
  })
})

$( document ).on('turbolinks:load', function() {
  $('#categories .sidebar-menu li:nth-of-type(2)').addClass('active');
  $('#categories .tab-pane:first-of-type').addClass('active in');
  $('#categories .tab-pane:first-of-type').removeClass('hidden-xs');
})