app = angular.module 'blockly-quiz'

app.controller 'msgModalController', ($scope, $uibModalInstance, header, msg) ->

	$scope.header = header
	$scope.msg = msg

	$scope.dismiss = () ->
		$uibModalInstance.dismiss()
