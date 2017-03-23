angular.module('mealSystem')
  .controller('NavCtrl', [
    '$scope',
    'orderService',
    '$window',
    '$interval',
    '$stateParams',
    function($scope, orders, $window, $interval, $stateParams) {
      //console.log("test");

      $scope.auth = orders.check();
      $scope.auth.then(function(data) {
        //console.log(orders.auth);
        $scope.auth = orders.auth.data.status;
        $scope.authName = orders.auth.data.name;
      });

      $scope.authNetwork = function authNetwork(network) {

        var openUrl = '/auth/' + network;
        window.$windowScope = $scope;
        var open = window.open(openUrl, "Authenticate Account", "width=500, height=500");

        var i = $interval(function() {
          try {
            if (open.closed || open === '') {
              $interval.cancel(i);
            }
            if (open.location.href.indexOf("/#!/homes") < 0) {
              $interval.cancel(i);
              open.close();
              window.location.reload();
            }
          } catch (e) {
            console.error(e);
          }
        }, 3000);
      };
    }
  ]);
