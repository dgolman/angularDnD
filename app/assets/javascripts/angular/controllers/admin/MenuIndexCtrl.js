admin.controller('MenuIndexCtrl', ['$scope', '$filter', '$routeParams', 'Restangular', function($scope, $filter, $routeParams, Restangular) {
 
 Restangular.one('api/restaurants', $routeParams.r_id).get().then(function(restaurant){
 	$scope.restaurant = restaurant;
 });

 Restangular.one('api/restaurants', $routeParams.r_id).all('menus').getList().then(function(menus){
    $scope.menus = menus;
  });

 $scope.create = function(menu) {
 	var newMenu = {};
    newMenu['menu'] = {};
    newMenu['menu'].name = menu.name;
    $scope.menus.post(newMenu).then(function(menu){
    	$scope.menus.push(menu);
    })
 };

}]);