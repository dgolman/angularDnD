admin.controller('RestaurantCtrl', ['$scope', '$filter', '$routeParams', 'Restangular', function($scope, $filter, $routeParams, Restangular) {
 
 Restangular.one('api/restaurants', $routeParams.r_id).get().then(function(restaurant){
    $scope.restaurant = restaurant;
  });

 $scope.destroy = function(id, index) {
    $scope.restaurant.remove({restaurant_id: id});
  };

}]);