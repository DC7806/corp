$( document ).on('turbolinks:load', function() {
  // faq items toggle display
  $('#faq .faq-item a').on('click', function(event){
  $(this).children('i').toggleClass('down');
  $(this).siblings('div').toggleClass('hidden');
  event.preventDefault();
  });
  // dropdown rotate
  $('.dropdown-rotate').on('click', function(event){
    $(this).children('i').toggleClass('down');
    $(this).next().removeClass('hidden-xs');
    $(this).next().addClass('active in');
    $(this).siblings('a').children('i').removeClass('down');
    $(this).next().siblings('div').addClass('hidden-xs');
    event.preventDefault();
  });
  // categories#index toggle display
  $('#categories .sidebar-menu li:nth-of-type(2)').addClass('active');
  $('#categories .tab-pane:first-of-type').addClass('active in');
  $('#categories .tab-pane:first-of-type').removeClass('hidden-xs');
  // make first product tab panes show
  $('#product-details-btm li:first-child, #product-details-btm .tab-pane:first-of-type').addClass('active');
  // side-nav dropdown  
  $('.side-nav .sidebar-inner li a').click(function(event) {
        event.stopPropagation();
        $(this).find(".side-nav .sidebar-inner li a").removeClass('menu-open');
        $(this).parents(".side-nav .sidebar-inner li a").addClass('menu-open');
        $(this).toggleClass('menu-open');
        $(this).parent().children('ul.side-sub-menu').toggle(200);
    });
})