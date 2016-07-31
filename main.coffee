app = angular.module 'blockly-quiz', ['ngRoute']

app.config ($routeProvider) ->
	$routeProvider
		.when '/',
			controller: 'quizController'
			templateUrl: 'views/quiz'
