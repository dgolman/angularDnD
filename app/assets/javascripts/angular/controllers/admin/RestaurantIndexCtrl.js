admin.controller('RestaurantIndexCtrl', ['$scope', '$filter', '$routeParams', 'Restangular', function($scope, $filter, $routeParams, Restangular) {
 
 Restangular.one('api/user').all('restaurants').getList().then(function(restaurants){
    $scope.restaurants = restaurants;
  });

 $scope.create = function(restaurant) {
 	var newRestaurant = {};
    newRestaurant['restaurant'] = {};
    newRestaurant['restaurant'].name = restaurant.name;
    $scope.restaurants.post(newRestaurant).then(function(restaurant){
    	$scope.restaurants.push(restaurant);
    })
 };

}]);