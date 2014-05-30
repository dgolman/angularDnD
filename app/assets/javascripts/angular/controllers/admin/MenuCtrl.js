admin.controller('MenuCtrl', ['$scope', '$filter', '$routeParams', 'Restangular', function($scope, $filter, $routeParams, Restangular) {
 
  Restangular.one('api/restaurants', $routeParams.r_id).get().then(function(restaurant){
   $scope.restaurant = restaurant;
  });

  Restangular.one('api/menus', $routeParams.m_id).get().then(function(menu){
    $scope.menu = menu;
    menu.all('sections').getList().then(function(sections){
      $scope.menu.menu_sections = sections;
    });
  });
  
  $scope.create = function(menu_section) {
    var newSection = {};
    newSection['menu_section'] = {};
    newSection['menu_section'].title = menu_section.title;
    $scope.menu.menu_sections.post(newSection).then(function(section){
      $scope.menu.menu_sections.push(section);
    });
  };

  $scope.destroy = function(id, index) {
    $scope.menu.menu_sections.splice(index, 1);
    $scope.menu.menu_sections.remove({section_id: id});
  };

}]);