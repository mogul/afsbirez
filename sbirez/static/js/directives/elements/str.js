'use strict';

angular.module('sbirezApp').directive('str', function() {
  return {
    restrict: 'A',
    replace: true,
    scope: {
      str: '=',
      multiplename: '=?',
      multipletoken: '=?'
    },
    templateUrl: 'static/views/partials/elements/str.html',
    controller: ['$scope', 'ProposalService',
      function ($scope, ProposalService) {
        $scope.element = $scope.str;
        $scope.fieldName = $scope.element.human;
        $scope.options = [];
        $scope.visible = true;
        $scope.validationstorage = '';

        var validationCallback = function(data) {
          $scope.validationstorage = data;
        };

        var askIfCallback = function(data) {
          $scope.visible = (data === true || data === 'true');
        };

        $scope.storage = ProposalService.register($scope.element,
                                 validationCallback,
                                 $scope.element.ask_if !== null ? askIfCallback : null,
                                 $scope.multipletoken);
        if ($scope.storage.length === undefined) {
          $scope.storage = '';
        }

        $scope.fieldName = $scope.element.human;
        if ($scope.multiplename !== undefined && $scope.element.human.indexOf('%multiple%') > -1) {
          $scope.fieldName = $scope.element.human.replace('%multiple%', $scope.multiplename);
        }

        $scope.fieldToken = $scope.element.name;
        if ($scope.multipletoken !== undefined) {
          $scope.fieldToken = $scope.element.name + '_' + $scope.multipletoken;
        }

        $scope.apply = function() {
          ProposalService.apply($scope.element, $scope.storage, $scope.multipletoken);
        };

        if ($scope.multiplename !== undefined && $scope.fieldName.indexOf('%multiple%') > -1) {
          $scope.fieldName = $scope.fieldName.replace('%multiple%', $scope.multiplename);
        }

        if ($scope.element.validation) {
          var validationElements = $scope.element.validation.split(' ');
          if (validationElements[0] === 'one_of' && validationElements.length > 2) {
            validationElements.splice(0,1);
            if (validationElements[0].slice(0, 1) === '"') {
              var options = validationElements.join(' ');
              validationElements = options.split(',');
              for (var i = 0; i < validationElements.length; i++) {
                validationElements[i] = validationElements[i].trim();
                validationElements[i] = validationElements[i].slice(1, validationElements[i].length - 1);
              }
              $scope.options = validationElements;
            } else {
              $scope.options = validationElements;
            }
          }
        }
      }
    ]
  };
});
