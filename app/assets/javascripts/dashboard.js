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


	app.controller('PlanController', function($scope) {

		$scope.message = 'new plan stuff';
	});

  app.controller('weatherController', function($scope) {
		$scope.message = 'weahter api data';
	});

app.controller('airportController',function($scope){
  $scope.message = 'airport list api';
});
