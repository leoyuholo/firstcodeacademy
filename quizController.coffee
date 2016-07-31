app = angular.module 'blockly-quiz'

app.controller 'quizController', ($scope) ->
	$scope.title = 'Blockly Quiz'
	$scope.questions = [
		{
			index: 0
			title: 'Initialize a Global Variable'
			description: 'Define (initialize) a global variable named Y and give it an initial value of 169.'
			hint: 'hint for initialize a global variable'
			answer: 'quiz answer'
			tutorial:
				title: 'How to initialize a global variable'
				url: 'https://github.com'
		},
		{
			index: 1
			title: 'Using If Statement'
			description: 'Add a simple if statement to the workspace that sets counter to 0 if its value equals 50. Assume that counter has been set to a random value between 1 and 100.'
			hint: 'hint for using if statement'
			answer: 'quiz answer'
			tutorial:
				title: 'How to use if statement'
				url: 'https://github.com'
		}
	]
	$scope.question = $scope.questions[0]

	$scope.previousQuestion = () -> $scope.question = $scope.questions[$scope.question.index - 1]
	$scope.nextQuestion = () -> $scope.question = $scope.questions[$scope.question.index + 1]

	$scope.goToQuestion = (question) ->
		$scope.question = question
