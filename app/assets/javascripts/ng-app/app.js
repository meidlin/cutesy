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

     .state('testfeed', {
          url: '/testfeed',
          templateUrl: 'testfeed.html',
          controller: 'testfeedController'
     })

     .state('testprofile', {
          url: '/testprofile',
          templateUrl: 'testprofile.html',
          controller: 'testprofileController'
     })

     .state('leaderboard', {
         	url: '/leaderboard',
         	templateUrl: 'leaderboard.html',
         	controller: 'leaderboardController'
     });

})

.controller('testprofileController', function($scope, api){
   api.getUsers()
   .then(function(data){
    $scope.users = data.data;
   });

   $scope.handle = "@handle_test";
   $scope.mikeimage = "https://pbs.twimg.com/profile_images/3576116985/392f2c900b7737a2bb82b8ef86251305.jpeg";

})

.service('api', function($http) {
	return {
		getUsers: function(){

			var promise = $http.get('/api/sessions')
			.then(function(response){
				return response
			});
			return promise;
		}
	}
});