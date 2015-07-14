angular
	.module('beerApp', [])
	.controller('BeerController', BeerController);

	function BeerController($http,$scope) {
      var self = this;
      self.search_term = false;
      self.beers = [0,1,2,3]
      
      self.queryBrewDB = function(){
      	self.search_term = true;
      	url = "http://api.brewerydb.com/v2/search?q="+self.beerparam+"&type=beer&key=3fa253bbc1552ae76cdad8987cd4386b"
      	$.get(url, function(results){
      		self.beers = results["data"];
      		console.log(self.beers)
      		$scope.$apply()
      	})
      }
      self.selectBeer = function(index){
      	self.beerID = self.beers[index].id
      	self.search_term = false;
      }
    }
 
  	