/*
*	Radio button checked not working
*	Remove line_item
*	Edit line_item
*		-Remove all line_item_options from a line_item and then add the new ones
*
*
*
*
*/

app.controller('OrderStoreCtrl', ['$scope', '$filter', '$routeParams', 'Restangular', function($scope, $filter, $routeParams, Restangular) {
 
 $scope.total = 0.00;

 Restangular.one('api/restaurants/'+$routeParams.restaurant_id+'/ticket').get().then(function(ticket) {
 	$scope.order_ticket = {};
 	$scope.order_ticket.ticket = ticket;
 	$scope.order_ticket.item_counter = ticket.count;
 	$scope.order_ticket.line_items = [];

 	angular.forEach(ticket.line_items, function(line_item, key) {
 		$scope.order_ticket.line_items.push(line_item);
 		$scope.order_ticket.line_items[key].line_item_options = [];
 
 		angular.forEach(ticket.line_item_options, function(option, k) {
 			if(option.parent_id == line_item.unique_id) {
 				$scope.order_ticket.line_items[key].line_item_options.push(option);
 			}
 		});
 	});
 	console.log(ticket);
 });

 $scope.setSelected = function(item) {
 	$scope.option_ids = {};
 	$scope.radio_options = {};

 	$scope.selectedItem = {
 		item: item,
 		line_item: {
 			unique_id: $scope.order_ticket.item_counter,
 			menu_section_id: item.menu_section_id,
 			item_id: item.id,
 			name: item.title,
	 		price: item.price,
 		},
 		line_item_options: []
 	};
 	console.log(item);
 };

 $scope.addItemToOrderTicket = function() {
 	getOptions();
    $scope.order_ticket.ticket.post("", {line_item: $scope.selectedItem.line_item, line_item_options: $scope.selectedItem.line_item_options}).then(function(line_item){
    	$scope.order_ticket.line_items.push(line_item);
    	$scope.order_ticket.item_counter++;
    	console.log(line_item);
    });
 };

 function getOptions() {
 		//handle checkboxes
	    angular.forEach($scope.selectedItem.item.option_sections, function(section, key) {
	 		angular.forEach(section.options, function(option, k) {
	 			angular.forEach($scope.option_ids, function(bool, id) {
	 				if(bool && (id == option.id)) {
	 					var opt = {};
	 					opt.parent_id = $scope.order_ticket.item_counter;
	 					opt.id = id;
					 	opt.description = option.description;
					 	opt.price = option.price;
	 					$scope.selectedItem.line_item_options.push(opt);
	 				}
	 			});
	 		});
	 	});	

	    //handle radio buttons
	    angular.forEach($scope.radio_options, function(option, key) {
	    	var opt = {};
	    	opt.parent_id = $scope.order_ticket.item_counter;
	    	opt.id = key;
	    	opt.description = option.description;
	    	opt.price = option.price;
	    	$scope.selectedItem.line_item_options.push(opt);
	    });
 	}
 	

}]);