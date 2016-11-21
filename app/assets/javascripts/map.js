
function initMap() {
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 9,
    center: {lat: 37.712, lng: -122.213},
    streetViewControl: false,
    mapTypeId: 'terrain'
  });

  var flightPlanCoordinates = [
    {lat: 37.712, lng: -122.213},
    {lat: 38.283, lng: -122.288},
    {lat: 38.044, lng: -122.906},
    {lat: 37.618, lng: -122.384}
  ];
  var flightPath = new google.maps.Polyline({
    path: flightPlanCoordinates,
    geodesic: true,
    strokeColor: '#ff0000',
    strokeOpacity: 1.0,
    strokeWeight: 4
  });

  flightPath.setMap(map);
}
