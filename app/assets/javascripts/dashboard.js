var app = angular.module("flightApp", ["ui.router"]);

app.config(function($stateProvider, $urlRouterProvider) {
  $stateProvider
    .state("newplan", {
      url: "/new-plan",
      views: {
        "base": {
          templateUrl: "pages/base.html"
        },
        "actions@newplan": {
          templateUrl: "pages/plan.html",
          controller: "PlanController"
        }
      }
    })
    .state("weather", {
      url: "/weather",
      views: {
        "base": {
          templateUrl: "pages/base.html"
        },
        "actions@weather": {
          templateUrl: "pages/weather.html",
          controller: "weatherController"
        },
        "map@weather": {
          controller: "MapController",
          templateUrl: "pages/map.html"
        }
      }
    })
    // $routeProvider
		// 	// route to new plan
		// 	.when('/new-plan', {
		// 		templateUrl : 'pages/plan.html',
		// 		controller  : 'PlanController'
		// 	})
    //   //route to weather
		// 	.when('/weather', {
		// 		templateUrl : 'pages/weather.html',
		// 		controller  : 'weatherController'
		// 	})
    //
		// 	// route to airport
		// 	.when('/airports', {
		// 		templateUrl : 'pages/airports.html',
		// 		controller  : 'airportController'
		// 	});

      $urlRouterProvider.otherwise("/new-plan");
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

  app.controller('weatherController', function() {
    var vm=this;
		vm.message = 'weahter api data';
	});

app.controller('airportController',function(){
  var vm=this;
  vm.message = 'airport list api';
});
