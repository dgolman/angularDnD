app.directive('ngMenu', ['Restangular', '$routeParams', function(Restangular, $routeParams) {
  return {
    restrict: 'A',
    link: function (scope, elem, attrs) {

      Restangular.one('api/restaurants', $routeParams.restaurant_id).get().then(function(restaurant) {
        scope.restaurant = restaurant;
      });

      Restangular.one('api/restaurants/'+$routeParams.restaurant_id+'/menus', $routeParams.menu_id).get().then(function(menu) {
        scope.menu_sections = menu.menu_sections;
        angular.forEach(menu.menu_sections, function(section, i) {

          item_index = 0;
          scope.menu_sections[i].menu_items = [];

          angular.forEach(menu.menu_items, function(item, j) {

            if(section.id == item.menu_section_id) {

              option_section_index = 0;
              scope.menu_sections[i].menu_items[item_index] = item;
              scope.menu_sections[i].menu_items[item_index].option_sections = [];

              angular.forEach(menu.menu_item_option_sections, function(option_section, k) {

                if(item.id == option_section.menu_item_id) {

                  option_index = 0;
                  scope.menu_sections[i].menu_items[item_index].option_sections[option_section_index] = option_section;
                  scope.menu_sections[i].menu_items[item_index].option_sections[option_section_index].options = [];

                  angular.forEach(menu.menu_item_options, function(option, l) {

                    if(option_section.id == option.menu_item_option_section_id) {
                      scope.menu_sections[i].menu_items[item_index].option_sections[option_section_index].options[option_index] = option;
                      option_index++;
                    }
                  });
                  option_section_index++;
                }
              });
              item_index++;
            }
          });
});
});
}
}
}]);

app.directive('ngOptionSections', ['Restangular', '$routeParams', function(Restangular, $routeParams) {
  return {
    restrict: 'A',
    link: function (scope, elem, attrs) {
      Restangular.one('api/menus/'+$routeParams.menu_id+'/section/'+attrs.menuSectionId+'/item', attrs.itemId).all('option_sections').getList().then(function(option_sections){
        
        scope.order_ticket.line_items[attrs.index].option_sections = option_sections;

        angular.forEach(option_sections, function(option_section, key){
          Restangular.one('api/menus/'+$routeParams.menu_id+'/section/'+attrs.menuSectionId+'/item/'+attrs.itemId+'/option_section',option_section.id).all('options').getList().then(function(options){
            scope.order_ticket.line_items[attrs.index].option_sections[key].options = options;
            
            angular.forEach(options, function(option, k){
              scope.order_ticket.line_items[attrs.index].option_sections[key].options[k].checked = false;
              
              angular.forEach(scope.order_ticket.line_items[attrs.index].line_item_options, function(line_item_option, j) {
                if(line_item_option.id == option.id) {
                  scope.order_ticket.line_items[attrs.index].option_sections[key].options[k].checked = true;
                }
              });

            });
            
          });
          console.log(scope.order_ticket.line_items[attrs.index].option_sections);
        });

      });
    }
  }
}]);