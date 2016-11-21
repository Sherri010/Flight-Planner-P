var app = angular.module("flightApp", ["ngRoute"]);

app.config(function($routeProvider) {
		$routeProvider
			// route to new plan
			.when('/new-plan', {
				templateUrl : 'pages/plan.html',
				controller  : 'PlanController'
			})
      //route to weather
			.when('/weather', {
				templateUrl : 'pages/weather.html',
				controller  : 'weatherController'
			})

			// route to airport
			.when('/airports', {
				templateUrl : 'pages/airports.html',
				controller  : 'airportController'
			});
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
