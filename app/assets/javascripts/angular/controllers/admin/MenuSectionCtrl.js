admin.controller('MenuSectionCtrl', ['$scope', '$filter', '$routeParams', 'Restangular', function($scope, $filter, $routeParams, Restangular) {
  
  Restangular.one('api/restaurants', $routeParams.r_id).get().then(function(restaurant){
   $scope.restaurant = restaurant;
  });

  Restangular.one('api/menus', $routeParams.m_id).get().then(function(menu){
    $scope.menu = menu;
    menu.one('section', $routeParams.sec_id).get().then(function(section){
      $scope.menu.menu_section = section;
      Restangular.one('api/menus/'+$routeParams.m_id+'/section', $routeParams.sec_id).all('items').getList().then(function(items){
        $scope.menu.menu_section.menu_items = items;
      });
    });
  });
  

  $scope.create = function(item) {
    var newItem = {};
    newItem['menu_item'] = {};
    newItem['menu_item'].title = item.name;
    newItem['menu_item'].price = item.price;
    newItem['menu_item'].description = item.description;
    $scope.menu.menu_section.menu_items.post(newItem).then(function(item){
      $scope.menu.menu_section.menu_items.push(item);
    });
  };

  $scope.destroy = function(id, index) {
    $scope.menu.menu_section.menu_items.splice(index, 1);
    $scope.menu.menu_section.menu_items.remove({item_id: id});
  };

}]);