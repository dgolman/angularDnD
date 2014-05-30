var admin = angular.module("Admin", ['ngResource', 'ngRoute', 'rails', 'restangular']);

admin.config(function($routeProvider, $locationProvider) {
  $locationProvider.html5Mode(true);
  $routeProvider
    .when("/admin", { templateUrl: "/assets/admin/index.html", controller: "RestaurantIndexCtrl"})
    .when("/admin/restaurant/:r_id", { templateUrl: "/assets/restaurant/index.html", controller: "RestaurantCtrl"})
    .when("/admin/restaurant/:r_id/menus", { templateUrl: "/assets/admin/menus.html", controller: "MenuIndexCtrl"})
    .when("/admin/restaurant/:r_id/menu/:m_id", { templateUrl: "/assets/admin/menu/index.html", controller: "MenuCtrl"})
    .when("/admin/restaurant/:r_id/menu/:m_id/section/:sec_id", { templateUrl: "/assets/admin/menu/menu_section.html", controller: "MenuSectionCtrl"})
    .when("/admin/restaurant/:r_id/menu/:m_id/section/:sec_id/item/:item_id", { templateUrl: "/assets/admin/menu/menu_item.html", controller: "MenuItemCtrl"})
    .when("/admin/restaurant/:r_id/menu/:m_id/section/:sec_id/item/:item_id/option_section/:option_section_id", { templateUrl: "/assets/admin/menu/menu_option_section.html", controller: "MenuOptionSectionCtrl"})
});