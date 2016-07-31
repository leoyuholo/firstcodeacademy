app = angular.module 'blockly-quiz', ['ngRoute', 'ui.bootstrap']

app.config ($routeProvider) ->
	$routeProvider
		.when '/',
			controller: 'quizController'
			templateUrl: 'views/quiz'
