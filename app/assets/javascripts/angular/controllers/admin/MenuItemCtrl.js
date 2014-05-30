admin.controller('MenuItemCtrl', ['$scope', '$filter', '$routeParams', 'Restangular', function($scope, $filter, $routeParams, Restangular) {
  

 Restangular.one('api/restaurants', $routeParams.r_id).get().then(function(restaurant){
  $scope.restaurant = restaurant;
 });
   
 Restangular.one('api/menus', $routeParams.m_id).get().then(function(menu){
    $scope.menu = menu;
    menu.one('section', $routeParams.sec_id).get().then(function(section){
      $scope.menu.menu_section = section;
      Restangular.one('api/menus/'+$routeParams.m_id+'/section/'+$routeParams.sec_id+'/item', $routeParams.item_id).get().then(function(item){
        $scope.menu.menu_section.menu_item = item;
        Restangular.one('api/menus/'+$routeParams.m_id+'/section/'+$routeParams.sec_id+'/item', $routeParams.item_id).all('option_sections').getList().then(function(option_sections){
          $scope.menu.menu_section.menu_item.menu_item_option_sections = option_sections;
        });
      });
    });
  });

  $scope.create = function(option_section) {
    var newOptionSection = {};
    newOptionSection['menu_option_section'] = {};
    newOptionSection['menu_option_section'].description = option_section.description;
    newOptionSection['menu_option_section'].radiobuttons = option_section.radio;
    
    $scope.menu.menu_section.menu_item.menu_item_option_sections.post(newOptionSection).then(function(option_section){
      $scope.menu.menu_section.menu_item.menu_item_option_sections.push(option_section);
    });
  };

  $scope.destroy = function(id, index) {
    $scope.menu.menu_section.menu_item.menu_option_sections.splice(index, 1);
    $scope.menu.menu_section.menu_item.menu_option_sections.remove({option_section_id: id});
  };

}]);
