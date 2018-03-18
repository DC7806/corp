$( document ).on('turbolinks:load', function() {
  $('#faq .faq-item a').on('click', function(event){
  $(this).children('i').toggleClass('down');
  $(this).siblings('div').toggleClass('hidden');
  event.preventDefault();
  })
})

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

$( document ).on('turbolinks:load', function() {
  // make first product tab panes show
  $('#product-details-btm li:first-child, #product-details-btm .tab-pane:first-of-type').addClass('active');
})

// Google maps main api
var markers = [
    {   // Map Coordination 
        "lat": '23.725994',
          "lng": '120.516769',
    // Map pop up desription
    "description": '<div class="map-info"><h3>We Are Here</h3> <p>媽我在這</p></div>'
      }
];

window.onload = function () {
  var mapOptions = {
    center: new google.maps.LatLng(markers[0].lat, markers[0].lng),
        zoom: 15,
    flat: false,
    scrollwheel:false,
    panControl:false,
    zoomControl:true,
    streetViewControl: false,
    mapTypeControl: false,
  
// Google maps style  
  styles: [{"featureType":"landscape","stylers":[{"saturation":-100},{"lightness":65},{"visibility":"on"}]},{"featureType":"poi","stylers":[{"saturation":-100},{"lightness":51},{"visibility":"simplified"}]},{"featureType":"road.highway","stylers":[{"saturation":-100},{"visibility":"simplified"}]},{"featureType":"road.arterial","stylers":[{"saturation":-100},{"lightness":30},{"visibility":"on"}]},{"featureType":"road.local","stylers":[{"saturation":-100},{"lightness":40},{"visibility":"on"}]},{"featureType":"transit","stylers":[{"saturation":-100},{"visibility":"simplified"}]},{"featureType":"administrative.province","stylers":[{"visibility":"off"}]},{"featureType":"water","elementType":"labels","stylers":[{"visibility":"on"},{"lightness":-25},{"saturation":-100}]},{"featureType":"water","elementType":"geometry","stylers":[{"hue":"#ffff00"},{"lightness":-25},{"saturation":-97}]}],
  mapTypeId: google.maps.MapTypeId.ROADMAP
      };
    var infoWindow = new google.maps.InfoWindow();
    var map = new google.maps.Map(document.getElementById("google-map"), mapOptions);
    for (i = 0; i < markers.length; i++) {
    var data = markers[i]
          var myLatlng = new google.maps.LatLng(data.lat, data.lng);
    
    var marker = new google.maps.Marker({
          position: myLatlng,
          map: map,
    // Marker Images
        // icon: 'http://mlmeniaga.com/website/html/exort/images/logo/logo.png',
          title: data.title
          });
    (function (marker, data) {
          google.maps.event.addListener(marker, "click", function (e) {
              infoWindow.setContent(data.description);
              infoWindow.open(map, marker);
            });
          })(marker, data);
      }
  };