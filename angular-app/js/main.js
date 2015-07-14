angular
	.module('beerApp', [])
	.controller('BeerController', BeerController);
	function BeerController($http) {
      var self = this;
      self.search_term = false;
      self.queryBrewDB = function(){
      	self.search_term = true;
      	url = "http://api.brewerydb.com/v2/search?q="+self.beerparam+"&type=beer&key=3fa253bbc1552ae76cdad8987cd4386b"
      	$.get(url, function(results){
      		self.beers = results["data"];
      		console.log(self.beers)
      	})
      }
  }
  
      