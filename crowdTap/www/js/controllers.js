angular.module('starter.controllers', [])

.controller('AppCtrl', function($scope, $ionicModal, $timeout) {

  // With the new view caching in Ionic, Controllers are only called
  // when they are recreated or on app start, instead of every page change.
  // To listen for when this page is active (for example, to refresh data),
  // listen for the $ionicView.enter event:
  //$scope.$on('$ionicView.enter', function(e) {
  //});

  // Form data for the login modal
  $scope.loginData = {};

  // Create the login modal that we will use later
  $ionicModal.fromTemplateUrl('templates/login.html', {
    scope: $scope
  }).then(function(modal) {
    $scope.modal = modal;
  });

  // Triggered in the login modal to close it
  $scope.closeLogin = function() {
    $scope.modal.hide();
  };

  // Open the login modal
  $scope.login = function() {
    $scope.modal.show();
  };

  // Perform the login action when the user submits the login form
  $scope.doLogin = function() {
    console.log('Doing login', $scope.loginData);

    // Simulate a login delay. Remove this and replace with your login
    // code if using a login system
    $timeout(function() {
      $scope.closeLogin();
    }, 1000);
  };
})



.controller('PlaylistsCtrl', function($http,$scope,$stateParams){
    $scope.beer = {};
    $http.get("https://crowdtap.herokuapp.com/api/beers", { cache: true }).then(function(results){
      $scope.getBeers = results.data
    });

    $scope.search_term = false;
      
    $scope.queryBrewDB = function(){
   
      var url = "http://api.brewerydb.com/v2/search?q="+$scope.beer.beerparam+"&type=beer&key=3fa253bbc1552ae76cdad8987cd4386b"
      $scope.search_term = true;
      console.log(url)
      $http.get(url, { cache: true }).then(function(results){
        $scope.beers = results.data.data;
        console.log($scope.beers)
        // $scope.$apply()
      })
    }
     
    $scope.selectBeer = function(index){
      $scope.beerID = $scope.beers[index].id
      $scope.search_term = false;
      var elementPos = $scope.getBeers.map(function(x) {return x.breweryDB_id; }).indexOf($scope.beerID) + 1
      console.log(elementPos)
      var ind = elementPos.toString();
      var url = "https://crowdtap.herokuapp.com/api/beers/"+ ind
      $http.get(url).then(function(results){
          $scope.results = results.data
          console.log($scope.results)
      initialize_my_map($scope.results,$scope.locparam)
      })
    }
    var url = "https://crowdtap.herokuapp.com/api/restaurants/"  
    angular.element().ready(function(){
      $http.get(url).success(function(result){
          markers = result;
          console.log(markers)
          initialize_my_map(markers)
        })
      
    })
    

});

