angular.module('spaApp', ['ui.router', 'templates'])

.config(function($stateProvider, $urlRouterProvider) {


$urlRouterProvider.otherwise('/');

	$stateProvider

     .state('feed', {
          url: '/feed',
          templateUrl: 'feed.html',
          controller: 'feedController'
     })

     .state('profile', {
     	url: '/profile',
     	templateUrl: 'profile.html',
     	controller: 'profileController'
     })

     .state('betasignup', {
     	url: '/betasignup',
     	templateUrl: 'betasignup.html',
     	controller: 'betasignupController'
     })

     .state('testprofile', {
          url: '/testprofile',
          templateUrl: 'testprofile.html',
          controller: 'testprofile'

     })

     .state('leaderboard', {
     	url: '/leaderboard',
     	templateUrl: 'leaderboard.html',
     	controller: 'leaderboardController'
     });

})

	.controller('homeController', function($scope){

		api.getPlanets()
		.then(function(data){
			$scope.data = data.data;
		});

	})
.service('api', function($http){
	return {
		getPlanets: function(){

			var promise = $http.get('/api/planets')
			.then(function(response){
				return response;
			});
			return promise;
		}
	};
});