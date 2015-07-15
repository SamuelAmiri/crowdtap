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
      $scope.foo = 'bar';
      $http.get("http://localhost:3000/api/beers", { cache: true }).then(function(results){
        getBeers = results.data
      });

      $scope.search_term = false;
      
      $scope.queryBrewDB = function(){
        $scope.search_term = true;
        url = "http://api.brewerydb.com/v2/search?q="+$scope.beerparam+"&type=beer&key=3fa253bbc1552ae76cdad8987cd4386b"
        $http.get(url, function(results){
          $scope.beers = results["data"];
          console.log($scope.beers)
          $scope.$apply()
        })
      }
      $scope.selectBeer = function(index){
        $scope.beerID = $scope.beers[index].id
        $scope.search_term = false;
        var elementPos = getBeers.map(function(x) {return x.breweryDB_id; }).indexOf($scope.beerID) + 1
        console.log(elementPos)
        initialize_my_map(elementPos,$scope.locparam)

      }
    angular.element().ready(function(){initialize_my_map(1,'mexico city')})
    

});

