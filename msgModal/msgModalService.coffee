app = angular.module 'blockly-quiz'

app.service 'msgModalService', ($uibModal) ->
	self = {}

	self.show = (header, msg, done) ->
		options =
			controller: 'msgModalController'
			templateUrl: 'views/msgModal'
			resolve:
				header: () -> header
				msg: () -> msg

		modal = $uibModal.open options

		modal.closed.then done

	return self
