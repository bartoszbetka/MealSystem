angular.module('mealSystem')
  .factory('orderService', [
    '$http',
    function($http) {
      var o = {
        orders: [{}],
        ordersActive: [{}],
        ordersHistory: [{}],
        auth: []
      };

      o.getAll = function() {
        return $http.get('/orders.json').then(function(data) {
          //console.log(data.data);
          angular.copy(data.data, o.orders);
        });
      };

      o.getActive = function() {
        return $http.get('/active.json').then(function(data) {
          //console.log(data.data);
          angular.copy(data.data, o.ordersActive);
        });
      };
      o.getHistory = function() {
        return $http.get('/history.json').then(function(data) {
          //console.log(data.data);
          angular.copy(data.data, o.ordersHistory);
        });
      };
      o.createOrder = function(order) {
        return $http.post('/orders.json', order).then(function(data) {
          //console.log(data.data);
          o.orders.push(data.data);
        });
      };
      o.addMeal = function(id, meal) {
        return $http.post('/orders/' + id + '/meals.json', meal);
      };

      o.check = function() {
        return $http.get('/me.json').then(function(data) {
          angular.copy(data, o.auth);
          //console.log(o.auth);
          //console.log(data.data);
        });
      };

      o.orderStatus = function(order, orderStatus) {
        var data = {
          order_status_id: orderStatus
        };
        return $http.put('/orders/' + order.id + '/status.json', JSON.stringify(data))
          .then(function(response) {
            //console.log(order.order_status_id);
            //console.log(orderStatus);
          });
      };

      return o;
    }
  ]);
