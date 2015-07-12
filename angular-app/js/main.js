angular
	.module('beerApp', [])
	.controller('BeerController', BeerController);
	function BeerController($http) {
      var self = this;
      self.foo = "bar";
  }
  
      