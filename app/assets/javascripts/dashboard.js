var app = angular.module("flightApp", ["ui.router"]);

app.config(function($stateProvider, $urlRouterProvider) {
    $stateProvider
        .state("map", {
            url: "/map",
            abstract: true,
            templateUrl: "pages/map.html",
            controller: "MapController"
        })
        .state("map.newplan", {
            url: "/new-plan",
            templateUrl: "pages/plan.html",
            controller: "PlanController"
        })
        .state("map.weather", {
            url: "/weather",
            templateUrl: "pages/weather.html",
            controller: "WeatherController"
        })
        .state("map.airports", {
            url: "/airports",
            templateUrl: "pages/airports.html",
            controller: "AirportController"
        });

    $urlRouterProvider.otherwise("/map/new-plan");
});

app.controller('MapController', function() {
    var vm = this;

    var labels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    var labelIndex = 0;

    var marker_list=[];

    function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
            zoom: 9,
            center: {lat: 37.712, lng: -122.213},
            streetViewControl: false,
            mapTypeId: 'terrain'
        });


        google.maps.event.addListener(map, 'click', function(event) {
            var new_marker={lat:event.latLng.lat(),lng:event.latLng.lng() }
            marker_list.push(new_marker);
            console.log(marker_list)
            addMarker(event.latLng, map);
            var flightPath = new google.maps.Polyline({
                path: marker_list,
                geodesic: true,
                strokeColor: '#ff0000',
                strokeOpacity: 1.0,
                strokeWeight: 4
            });
            flightPath.setMap(map);
        });
        function addMarker(location, map) {
            var marker = new google.maps.Marker({
                position: location,
                label: labels[labelIndex++ % labels.length],
                map: map
            });

        }

    }

    initMap();
});

app.controller('PlanController', function() {
    var vm= this;
    vm.message = 'new plan stuff';

});

app.controller('WeatherController', function() {
    var vm=this;
    vm.message = 'weahter api data';
});

app.controller('AirportController',function(){
    var vm=this;
    vm.message = 'airport list api';
});
