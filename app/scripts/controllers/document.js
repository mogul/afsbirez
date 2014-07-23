'use strict';

angular.module('sbirezApp')
  .controller('DocumentCtrl', function ($scope, $http, $upload) {

    $scope.progress = [];
    $scope.docList = [];
    $http.get('/api/documents').success(function(list) {
      console.log(list);
      $scope.docList = list;
    });

    $scope.downloadDoc = function(docId) {
      $http.get('/api/documents/' + docId).success(function(data) {
        var element = angular.element('<a/>');
        element.attr({
          href: 'data:attachment/pdf;charset=utf-8,' + encodeURI(data),
          target: '_blank',
          download:'test.pdf'
        })[0].click();
        console.log(data);
      });
    };

    var progressUpdate = function(evt, index) {
      console.log('Index: ' + index + ' Evt: ' + evt);
      $scope.progress[index] = Math.min(100,  parseInt(100.0 * evt.loaded /evt.total));
    };

    var uploadSuccess = function(data, status) {
      console.log('data: ' + data);
      console.log('status: ' + status);
      //console.log('headers: ' + headers);
      //console.log('config: ' + config);
    };

    $scope.onFileSelect = function($files) {
      $scope.selectedFiles = $files;
      $scope.progress = [];

      if ($scope.upload && $scope.upload.length > 0) {
        for (var i = 0; i < $scope.upload.length; i++) {
          if ($scope.upload[i] !== null) {
            $scope.upload[i].abort();
          }
        }
      }
     
      $scope.upload = [];
      $scope.uploadResult = [];
  
      var evt, data, status;
 
      for (var j = 0; j < $files.length; j++) {
        var file = $scope.selectedFiles[j];
        $scope.progress[j] = -1;
        console.log(file.name);
        $scope.upload = $upload.upload({
          url: '/api/documents',
          //data: {myObj: $scope.docModelObj},
          file: file
        }).progress(progressUpdate(evt, j))
          .success(uploadSuccess(data, status));
      }
    };
  });
