angular
    .module('disruptApp', []);

google.maps.event.addDomListener(window, 'load', initialize)

function initialize() {
	var mapProperties = {
	  center:new google.maps.LatLng(34.0129821,-118.495196),
	  zoom: 17,
	  mapTypeId: google.maps.MapTypeId.ROADMAP
	};
	var map=new google.maps.Map(document.getElementById("googleMap"), mapProperties);
	var marker=new google.maps.Marker({
		  position:myCenter, 
		  animation:google.maps.Animation.BOUNCE, //animates the marker
		  icon:'pinkball.png' // replace default marker with custom icon
		  });
	marker.setMap(map);
}