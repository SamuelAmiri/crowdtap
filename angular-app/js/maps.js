    
// The init function to load google map on page load
google.maps.event.addDomListener(window, 'load', initialize_my_map())
google.maps.event.addDomListener(window, 'page:load', initialize_my_map())
// Define a function that should be ran on load (yay function hoisting)

function initialize_my_map(index,loc) {
    $.get("http://localhost:3000/api/beers", function(results){
        var beers = results
    })
    // Find the map DIV (if it exists)
    var el = document.getElementById('googleMap')

    // Bail out if there's not an address map on the page
    if(!el) return

    // var result = $.grep(myArray, function(e){ return e.id == id; });
    // Get the page's marker data from the JSON API
    //var url = window.location.origin + window.location.pathname + ".json" + window.location.search 
    
    if(index) {
        var ind = index.toString();
        var url = "http://localhost:3000/api/beers/"+ ind 
    } else {
        var url = "http://localhost:3000/api/restaurants/"
    }
    
    // console.log(url)
    // console.log (window.location.origin)
    // console.log (window.location.pathname)
    // Ajax the data URL (this retrieves the contents of that JSON url above)
    $.get(url, function(results){
        
        // for (i=0;i<results.length;i++){
        //     console.log(results[i].lat, results[i].long)
        // }


        // Wrap the data in an array if it's not one already
        if(!(results instanceof Array)) results = [results] 
     
///
    if(loc){
        codeAddress(loc);
        
        var bounds = new google.maps.LatLngBounds()
    }else{
        if(navigator.geolocation) {
            browserSupportFlag = true;
            navigator.geolocation.getCurrentPosition(alert('yes'),alert('no'))
            //     function(position) {
            //     alert('hi')
            //   initialLocation = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
            //   console.log(initialLocation)
            //   map.setCenter(initialLocation);
            // }, function() {
            //         handleNoGeolocation(browserSupportFlag);
            // });  
            // var bounds = new google.maps.LatLngBounds()
            // }
          // Browser doesn't support Geolocation
    }
    function handleNoGeolocation(errorFlag) {
        if (errorFlag == true) {
          alert("Geolocation service failed.");
          initialLocation = newyork;
        } else {
          alert("Your browser doesn't support geolocation. We've placed you in Siberia.");
          initialLocation = siberia;
        }
        map.setCenter(initialLocation);
      }
    function codeAddress(location) {
            geocoder = new google.maps.Geocoder();
            var address = location;
            geocoder.geocode( { 'address': address}, function(results, status) {
              if (status == google.maps.GeocoderStatus.OK) {
                map.setCenter(results[0].geometry.location);
                map.setZoom(13)
              } else {
                alert("Geocode was not successful for the following reason: " + status);
              }
            });
        }
///
        // Create a map
        var mapProps = {
            zoom: 16,
            maxZoom: 18,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        }


        var map = new google.maps.Map(el, mapProps)

        var oms = new OverlappingMarkerSpiderfier(map);
        // Bounds are cool because they center our map for us
        var infowindow = new google.maps.InfoWindow({
        });
        

        var markers = []
        
                
        for (i = 0; i < results.length; i++) {
            var markerPosition = new google.maps.LatLng(results[i].lat, results[i].long)
            var marker = new google.maps.Marker({
                    position: markerPosition,
                    animation: google.maps.Animation.DROP
                
                    })
            marker.content = '<h5>' + results[i].name + '</h5><hr><h3>$' + results[i].price + '</h3><h6>' + results[i].rating + '</h6>' +
            // '<h6>' + results[i].city + ',' + results[i].state + ' ' + results[i].zipcode + '</h6>';  
            marker.setMap(map)
            map.fitBounds(bounds);
            markers.push(marker);
            oms.addMarker(marker);
            oms.addListener('click', function(marker, event) {
                infowindow.setContent(marker.content);
                infowindow.open(map, marker);
            });
        }
        (marker, i);
        var markerCluster = new MarkerClusterer(map, markers, { zoomOnClick: true, maxZoom: 16, gridSize: 10 })
    })
}
