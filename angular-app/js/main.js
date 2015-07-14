angular
	.module('beerApp', [])
	.controller('BeerController', BeerController);

	function BeerController($http,$scope) {
      var self = this;
      $.get("http://localhost:3000/api/beers", function(results){
        getBeers = results
        console.log(getBeers)
      })
      self.search_term = false;
      
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
      	var elementPos = getBeers.map(function(x) {return x.breweryDB_id; }).indexOf(self.beerID) + 1
      	console.log(elementPos)
      	initialize_my_map(elementPos,self.locparam)

      }
    }
 
  	