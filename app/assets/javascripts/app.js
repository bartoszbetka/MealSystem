angular.module('mealSystem', ['ui.router', 'templates'])

  .config([
    '$stateProvider',
    '$urlRouterProvider',
    function($stateProvider, $urlRouterProvider) {

      $stateProvider

        .state('home', {
          url: '/home',
          templateUrl: 'home/_home.html',
          controller: 'MainCtrl',
          resolve: {
            postPromise: ['orderService', function(orders) {
              //console.log(orders.getAll());
              return orders.getAll();
            }]
          }
        })
        .state('active', {
          url: '/active',
          templateUrl: 'active/_active.html',
          controller: 'MainCtrl',
          resolve: {
            postPromise: ['orderService', function(orders) {
              //console.log(orders.getAll());
              return orders.getActive();
            }]
          }

        })
        .state('history', {
          url: '/history',
          templateUrl: 'history/_history.html',
          controller: 'MainCtrl',
          resolve: {
            postPromise: ['orderService', function(orders) {
              //console.log(orders.getAll());
              return orders.getHistory();
            }]
          }
        });
      $urlRouterProvider.otherwise('home');
    }
  ])
