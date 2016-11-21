// var labels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
// var labelIndex = 0;
//
// var marker_list=[];
//
// function initMap() {
//   var map = new google.maps.Map(document.getElementById('map'), {
//     zoom: 9,
//     center: {lat: 37.712, lng: -122.213},
//     streetViewControl: false,
//     mapTypeId: 'terrain'
//   });
//
//
//   google.maps.event.addListener(map, 'click', function(event) {
//     var new_marker={lat:event.latLng.lat(),lng:event.latLng.lng() }
//     marker_list.push(new_marker);
//     console.log(marker_list)
//     addMarker(event.latLng, map);
//     var flightPath = new google.maps.Polyline({
//       path: marker_list,
//       geodesic: true,
//       strokeColor: '#ff0000',
//       strokeOpacity: 1.0,
//       strokeWeight: 4
//     });
// flightPath.setMap(map);
//  });
//  function addMarker(location, map) {
//    var marker = new google.maps.Marker({
//      position: location,
//      label: labels[labelIndex++ % labels.length],
//      map: map
//    });
//
//  }
//
// }
//
//   // var flightPlanCoordinates = [
//   //   {lat: 37.712, lng: -122.213},
//   //   {lat: 38.283, lng: -122.288},
//   //   {lat: 38.044, lng: -122.906},
//   //   {lat: 37.618, lng: -122.384}
//   // ];
