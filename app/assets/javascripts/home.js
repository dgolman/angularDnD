var app = angular.module("Home", ['ngResource', 'ngRoute', 'rails', 'restangular']);

app.config(function($routeProvider, $locationProvider) {
  $locationProvider.html5Mode(true);
  $routeProvider
    .when("/", { templateUrl: "/assets/index/index.html" })
    .when("/restaurant/:restaurant_id/menu/:menu_id", { templateUrl: "/assets/restaurant/menu.html", controller: "OrderStoreCtrl"})
});