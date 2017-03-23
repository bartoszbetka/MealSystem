angular.module('mealSystem')
  .controller('MainCtrl', [
    '$scope',
    'orderService',
    '$window',
    '$interval',
    '$stateParams',
    function($scope, orders, $window, $interval, $stateParams) {
      $scope.test = "Hello World!";
      $scope.orders = orders.orders;
      $scope.ordersActive = orders.ordersActive;
      $scope.ordersHistory = orders.ordersHistory;

      $scope.regexRestaurant = /^[a-zA-Z0-9\s]+$/;
      $scope.regexMealName = /^[a-zA-Z\s]+$/;
      $scope.regexMealPrice = /^\d+(?:\.\d{0,2})?$/;

      $scope.auth = orders.check();
      $scope.auth.then(function(data) {
        //console.log(orders.auth);
        $scope.auth = orders.auth.data.status;
      });


      $scope.data = {
        singleSelect: null,
      };

      $scope.statuss = function(order) {
        //console.log("test");
        orders.orderStatus(order, $scope.data.singleSelect);
        //order.order_status_id = $scope.data.singleSelect;
        switch ($scope.data.singleSelect) {
          case '1':
            order.order_status.status = "In Progress";
            break;
          case '2':
            order.order_status.status = "Ordered";
            break;
          case '3':
            order.order_status.status = "Delivered";
            break;
          case '4':
            order.order_status.status = "Finalized";
            break;
          default:
            order.order_status.status = "In progress";
        }
      }



      $scope.addOrder = function() {
        if (!$scope.restaurantName || $scope.restaurantName === ' ') {
          return;
        }
        orders.createOrder({
          restaurantName: $scope.restaurantName,
          totalSum: 0
        });
        $scope.restaurantName = ' ';
      };

      $scope.addMeal = function(order) {
        //console.log(order.meals.price);
        if (!order.meals.dishName || order.meals.dishName === '') {
          return;
        }
        if (!order.meals.price || order.meals.price === ' ') {
          return;
        }

        orders.addMeal(order.id, {
          name: order.meals.dishName,
          price: order.meals.price
        }).then(function(meal) {
          //console.log(meal.data);
          //console.log(order.totalPrice);
          if (!meal.data.name || meal.data.name === '') {
            return;
          }
          order.meals.push(meal.data)
          var w = parseFloat(order.totalPrice);
          var a = parseFloat(meal.data.price);
          var s = w + a
          //console.log($scope.orders[order.id]);
          order.totalPrice = s;
        });
        order.meals.dishName = '';
        order.meals.price = '';
      };

    }
  ]);
