admin.controller('MenuOptionSectionCtrl', ['$scope', '$filter', '$routeParams', 'Restangular', function($scope, $filter, $routeParams, Restangular) {
  
 Restangular.one('api/restaurants', $routeParams.r_id).get().then(function(restaurant){
  $scope.restaurant = restaurant;
 });

 Restangular.one('api/menus', $routeParams.m_id).get().then(function(menu){
    $scope.menu = menu;
    menu.one('section', $routeParams.sec_id).get().then(function(section){
      $scope.menu.menu_section = section;
      Restangular.one('api/menus/'+$routeParams.m_id+'/section/'+$routeParams.sec_id+'/item', $routeParams.item_id).get().then(function(item){
        $scope.menu.menu_section.menu_item = item;
        Restangular.one('api/menus/'+$routeParams.m_id+'/section/'+$routeParams.sec_id+'/item/'+$routeParams.item_id+'/option_section',$routeParams.option_section_id).get().then(function(option_section){
          $scope.menu.menu_section.menu_item.menu_item_option_section = option_section;
          Restangular.one('api/menus/'+$routeParams.m_id+'/section/'+$routeParams.sec_id+'/item/'+$routeParams.item_id+'/option_section',$routeParams.option_section_id).all('options').getList().then(function(options){
            $scope.menu.menu_section.menu_item.menu_item_option_section.menu_item_options = options;
          });
        });
      });
    });
  });

  $scope.create = function(option) {
    var newOption = {};
    newOption['menu_option'] = {};
    newOption['menu_option'].price = option.price;
    newOption['menu_option'].description = option.description;
    
    $scope.menu.menu_section.menu_item.menu_item_option_section.menu_item_options.post(newOption).then(function(option){
      $scope.menu.menu_section.menu_item.menu_item_option_section.menu_item_options.push(option);
    });
  };

  $scope.destroy = function(id, index) {
    $scope.menu.menu_section.menu_item.menu_option_section.menu_options.splice(index, 1);
    $scope.menu.menu_section.menu_item.menu_option_section.menu_options.remove({option_id: id});
  };

}]);
