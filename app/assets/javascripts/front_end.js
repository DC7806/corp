$( document ).on('turbolinks:load', function() {
  $('#faq .faq-item a').on('click', function(event){
  $(this).children('i').toggleClass('down');
  $(this).siblings().fadeToggle(300);
  event.preventDefault();
  })
})

$( document ).on('turbolinks:load', function() {
  $('.product-wrapper a').on('click', function(event){
  $(this).children('i').toggleClass('down');
  $(this).siblings().toggleClass('active');
  event.preventDefault();
  })
})


$( document ).on('turbolinks:load', function() {
	$('.product-tab').on('click', function(event){
		$(this).children('i').addClass('down');
		$(this).next().removeClass('hidden-xs');
		$(this).next().addClass('active in');
		$(this).siblings('a').children('i').removeClass('down');
		$(this).next().siblings('div').addClass('hidden-xs');
		event.preventDefault();
})
})