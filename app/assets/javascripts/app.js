angular.module('spaApp', ['ui.router', 'templates'])

.controller('navController', ['$scope', '$location', function($scope, $location){

  $scope.getUrlProfile = function(){
  window.location.assign('/users');
  };

  $scope.getUrlFeed = function(){
    window.location.assign('/#/feed');
  };

  $scope.getUrlLeader = function(){
    window.location.assign('/pets/leader');
  };

}])

.config(['$stateProvider', '$urlRouterProvider', function($stateProvider, $urlRouterProvider) {

// $urlRouterProvider.otherwise('/');

$stateProvider

     .state('/feed', {
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

     .state('editprof', {
          url: '/editprof',
          templateUrl: 'editprof.html',
          controller: 'testprofileController'
     })

     .state('createpet', {
          url: '/createpet',
          templateUrl: 'createpet.html',
          controller: 'createpetController'
     })

     .state('leaderboard', {
         	url: '/leaderboard',
         	templateUrl: 'leaderboard.html',
         	controller: 'leaderboardController'
     });

}])

// making any change so it will push

.controller('feedController', ['$scope', 'petsapi', function($scope, petsapi){
  petsapi.getPets()
  .then(function(data){
    $scope.pets = data.data.pets;
    console.log(data.data.pets);
    
    // From here, we experiment

  });
// Code to make ng-repeat show one at a time
  $scope.pets_index = 0;
  $scope.pets = {};

// function for proceeding through the next pet object in array
  

  $scope.choose = function(pets) {
    $scope.pets = pets;
  };

  // function for sending rating to pet object on click
  $scope.sendRating = function(isSkip){
    // instantiate empty object
    var ratingObject = {rating: {}};
    // ratingObject = { rating: {user_id: $scope.pets[$scope.pets_index].user_id}}
    ratingObject.rating.user_id = $scope.pets[$scope.pets_index].user_id;
    // ratingObject = { rating: {pet_id: $scope.pets[$scope.pets_index].id}}
    ratingObject.rating.pet_id = $scope.pets[$scope.pets_index].id;
    if(!isSkip)
      // Grab the rating value from the star thing
      ratingObject.rating.rating = document.getElementsByName('ratingsinput')[0].value;

    // AJAX call
    $.post("/ratings", ratingObject)
      .done(function(data) {
        console.log(data);
      }
    );
  // This is equivilant the next() function
    if ($scope.pets_index >= $scope.pets.length -1) {
      $scope.pets_index = 0;
    }
    else {
      $scope.pets_index ++;
    }
  };
}])

.service('petsapi', ['$http', function($http) {
  return {
    getPets: function(){

      var promise = $http.get('/pets')
      .then(function(response){
        return response
      });
      return promise;
    }
  }
}])

.service('api', ['$http', function($http) {
	return {
		getUsers: function(){

			var promise = $http.get('/api/sessions')
			.then(function(response){
				return response
			});
			return promise;
		}
	}
}]);