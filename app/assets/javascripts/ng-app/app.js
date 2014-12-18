angular.module('spaApp', ['ui.router', 'templates'])

.controller('navController', ['$scope', '$location', function($scope, $location){

  $scope.getUrlProfile = function(){
  window.location.assign('http://localhost:3000/users');
  };

  $scope.getUrlFeed = function(){
    window.location.assign('http://localhost:3000/#/feed');
  };

  $scope.getUrlLeader = function(){
    window.location.assign('http://localhost:3000/pets/leader');
  };

}])

.config(function($stateProvider, $urlRouterProvider) {

// $urlRouterProvider.otherwise('/');

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

})


.controller('feedController', function($scope, petsapi){
  petsapi.getPets()
  .then(function(data){
    $scope.pets = [data.data];
    $scope.pets = data.data;
    console.log(data.data);
    
    // From here, we experiment

  });
// Code to make ng-repeat show one at a time
  $scope.pets_index = 0;
  $scope.pets = {};

// function for proceeding through the next pet object in array
  $scope.next = function(){
    if ($scope.pets_index >= $scope.pets.length -1) {
      $scope.pets_index = 0;
    }
    else {
      $scope.pets_index ++;
    }
  };

  $scope.choose = function(pets) {
    $scope.pets = pets;
  };

  // function for sending rating to pet object on click
  $scope.sendRating = function(){
    
    // grab element and assign to variable input
    var input = document.getElementsByName('ratingsinput')[0];

    // grab value of element
    rating = input.value;
    console.log(rating);

    // instantiate empty object
    var ratingObject  = {};

    // add empty object property to ^ who has a value of an empty object
    // ratingObject = {rating: {} }
    ratingObject.rating = {};

    // ratingObject = { rating: {user_id: $scope.pets[$scope.pets_index].user_id}}
    ratingObject.rating.user_id = $scope.pets[$scope.pets_index].user_id;

    // ratingObject = { rating: {pet_id: $scope.pets[$scope.pets_index].id}}
    ratingObject.rating.pet_id = $scope.pets[$scope.pets_index].id;
    ratingObject.rating.rating = rating;

    // AJAX call
    $.post("/ratings", ratingObject)
      .done(function(data) {
        alert(data);
      });
   

  }
// Test var
  // $scope.test = 'darla test works';
})


// .controller('leaderboard', function($scope, api){
//   api.getPets()
//   .then(function(data){
//     $scope.pets = data.data;
//   });
//   $scope.petz = ["hi", "there", "matt"];

//   $scope.test = "test test test";
// })

.service('petsapi', function($http) {
  return {
    getPets: function(){

      var promise = $http.get('/petsapi/pets')
      .then(function(response){
        return response
      });
      return promise;
    }
    // partially done aka ask lorin lolz

    // getimgUrl: function(){
    //   var promise = $http.get('/petsapi/getpeturl')
    //         data: petsid
    //   .then(function(data){
    //     return data.peturl
    //   })
    // }
  }
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