app = angular.module 'blockly-quiz'

app.controller 'quizController', ($scope, msgModalService) ->
	$scope.title = 'Blockly Quiz'
	$scope.showJs = false
	$scope.questions = [
		{
			index: 0
			title: 'Initialize a Global Variable'
			description: 'Define (initialize) a global variable named Y and give it an initial value of 169.'
			hint: 'hint for initialize a global variable'
			answer: 'var Y;Y = 169;'
			tutorial:
				title: 'How to initialize a global variable'
				url: 'https://github.com'
		},
		{
			index: 1
			title: 'Using If Statement'
			description: 'Add a simple if statement to the workspace that sets counter to 0 if its value equals 50. Assume that counter has been set to a random value between 1 and 100.'
			hint: 'hint for using if statement'
			answer: 'var counter;if (counter == 50) {counter = 0;}'
			tutorial:
				title: 'How to use if statement'
				url: 'https://github.com'
		}
	]
	$scope.question = $scope.questions[0]

	$scope.goToQuestion = (question) ->
		$scope.question.workspace = Blockly.Xml.domToText Blockly.Xml.workspaceToDom workspace
		$scope.question = question
		if $scope.question.workspace
			workspace.clear()
			Blockly.Xml.domToWorkspace Blockly.Xml.textToDom($scope.question.workspace), workspace
		else
			workspace.clear()

	updateCode = () ->
		$scope.javascript = Blockly.JavaScript.workspaceToCode workspace

	$scope.showCode = () ->
		$scope.showJs = !$scope.showJs
		updateCode() if $scope.showJs

	$scope.submit = () ->
		answer = Blockly.JavaScript.workspaceToCode(workspace).split('\n').map( (s) -> s.trim()).join('')
		if $scope.question.answer == answer
			msgModalService.show 'Congrats!', 'You get 10 points!', _.noop
		else
			msgModalService.show 'Try again!', 'Your answer is some way different from expected. Try again!', _.noop

	toolbox = """
		<xml id="toolbox" style="display: none">
		<category colour="210" name="Logic">
		<block type="controls_if"/>
		<block type="logic_compare"/>
		<block type="logic_operation"/>
		<block type="logic_negate"/>
		<block type="logic_boolean"/>
		<block type="logic_null"/>
		<block type="logic_ternary"/>
		</category>
		<category colour="120" name="Loops">
		<block type="controls_repeat_ext">
		<value name="TIMES">
		<shadow type="math_number">
		<field name="NUM">10</field>
		</shadow>
		</value>
		</block>
		<block type="controls_whileUntil"/>
		<block type="controls_for">
		<value name="FROM">
		<shadow type="math_number">
		<field name="NUM">1</field>
		</shadow>
		</value>
		<value name="TO">
		<shadow type="math_number">
		<field name="NUM">10</field>
		</shadow>
		</value>
		<value name="BY">
		<shadow type="math_number">
		<field name="NUM">1</field>
		</shadow>
		</value>
		</block>
		<block type="controls_forEach"/>
		<block type="controls_flow_statements"/>
		</category>
		<category colour="230" name="Math">
		<block type="math_number"/>
		<block type="math_arithmetic">
		<value name="A">
		<shadow type="math_number">
		<field name="NUM">1</field>
		</shadow>
		</value>
		<value name="B">
		<shadow type="math_number">
		<field name="NUM">1</field>
		</shadow>
		</value>
		</block>
		<block type="math_single">
		<value name="NUM">
		<shadow type="math_number">
		<field name="NUM">9</field>
		</shadow>
		</value>
		</block>
		<block type="math_trig">
		<value name="NUM">
		<shadow type="math_number">
		<field name="NUM">45</field>
		</shadow>
		</value>
		</block>
		<block type="math_constant"/>
		<block type="math_number_property">
		<value name="NUMBER_TO_CHECK">
		<shadow type="math_number">
		<field name="NUM">0</field>
		</shadow>
		</value>
		</block>
		<block type="math_change">
		<value name="DELTA">
		<shadow type="math_number">
		<field name="NUM">1</field>
		</shadow>
		</value>
		</block>
		<block type="math_round">
		<value name="NUM">
		<shadow type="math_number">
		<field name="NUM">3.1</field>
		</shadow>
		</value>
		</block>
		<block type="math_on_list"/>
		<block type="math_modulo">
		<value name="DIVIDEND">
		<shadow type="math_number">
		<field name="NUM">64</field>
		</shadow>
		</value>
		<value name="DIVISOR">
		<shadow type="math_number">
		<field name="NUM">10</field>
		</shadow>
		</value>
		</block>
		<block type="math_constrain">
		<value name="VALUE">
		<shadow type="math_number">
		<field name="NUM">50</field>
		</shadow>
		</value>
		<value name="LOW">
		<shadow type="math_number">
		<field name="NUM">1</field>
		</shadow>
		</value>
		<value name="HIGH">
		<shadow type="math_number">
		<field name="NUM">100</field>
		</shadow>
		</value>
		</block>
		<block type="math_random_int">
		<value name="FROM">
		<shadow type="math_number">
		<field name="NUM">1</field>
		</shadow>
		</value>
		<value name="TO">
		<shadow type="math_number">
		<field name="NUM">100</field>
		</shadow>
		</value>
		</block>
		<block type="math_random_float"/>
		</category>
		<category colour="160" name="Text">
		<block type="text"/>
		<block type="text_join"/>
		<block type="text_append">
		<value name="TEXT">
		<shadow type="text"/>
		</value>
		</block>
		<block type="text_length">
		<value name="VALUE">
		<shadow type="text">
		<field name="TEXT">abc</field>
		</shadow>
		</value>
		</block>
		<block type="text_isEmpty">
		<value name="VALUE">
		<shadow type="text">
		<field name="TEXT"/>
		</shadow>
		</value>
		</block>
		<block type="text_indexOf">
		<value name="VALUE">
		<block type="variables_get">
		<field name="VAR">{textVariable}</field>
		</block>
		</value>
		<value name="FIND">
		<shadow type="text">
		<field name="TEXT">abc</field>
		</shadow>
		</value>
		</block>
		<block type="text_charAt">
		<value name="VALUE">
		<block type="variables_get">
		<field name="VAR">{textVariable}</field>
		</block>
		</value>
		</block>
		<block type="text_getSubstring">
		<value name="STRING">
		<block type="variables_get">
		<field name="VAR">{textVariable}</field>
		</block>
		</value>
		</block>
		<block type="text_changeCase">
		<value name="TEXT">
		<shadow type="text">
		<field name="TEXT">abc</field>
		</shadow>
		</value>
		</block>
		<block type="text_trim">
		<value name="TEXT">
		<shadow type="text">
		<field name="TEXT">abc</field>
		</shadow>
		</value>
		</block>
		<block type="text_print">
		<value name="TEXT">
		<shadow type="text">
		<field name="TEXT">abc</field>
		</shadow>
		</value>
		</block>
		<block type="text_prompt_ext">
		<value name="TEXT">
		<shadow type="text">
		<field name="TEXT">abc</field>
		</shadow>
		</value>
		</block>
		</category>
		<category colour="260" name="Lists">
		<block type="lists_create_with">
		<mutation items="0"/>
		</block>
		<block type="lists_create_with"/>
		<block type="lists_repeat">
		<value name="NUM">
		<shadow type="math_number">
		<field name="NUM">5</field>
		</shadow>
		</value>
		</block>
		<block type="lists_length"/>
		<block type="lists_isEmpty"/>
		<block type="lists_indexOf">
		<value name="VALUE">
		<block type="variables_get">
		<field name="VAR">{listVariable}</field>
		</block>
		</value>
		</block>
		<block type="lists_getIndex">
		<value name="VALUE">
		<block type="variables_get">
		<field name="VAR">{listVariable}</field>
		</block>
		</value>
		</block>
		<block type="lists_setIndex">
		<value name="LIST">
		<block type="variables_get">
		<field name="VAR">{listVariable}</field>
		</block>
		</value>
		</block>
		<block type="lists_getSublist">
		<value name="LIST">
		<block type="variables_get">
		<field name="VAR">{listVariable}</field>
		</block>
		</value>
		</block>
		<block type="lists_split">
		<value name="DELIM">
		<shadow type="text">
		<field name="TEXT">,</field>
		</shadow>
		</value>
		</block>
		<block type="lists_sort"/>
		</category>
		<category colour="20" name="Colour">
		<block type="colour_picker"/>
		<block type="colour_random"/>
		<block type="colour_rgb">
		<value name="RED">
		<shadow type="math_number">
		<field name="NUM">100</field>
		</shadow>
		</value>
		<value name="GREEN">
		<shadow type="math_number">
		<field name="NUM">50</field>
		</shadow>
		</value>
		<value name="BLUE">
		<shadow type="math_number">
		<field name="NUM">0</field>
		</shadow>
		</value>
		</block>
		<block type="colour_blend">
		<value name="COLOUR1">
		<shadow type="colour_picker">
		<field name="COLOUR">#ff0000</field>
		</shadow>
		</value>
		<value name="COLOUR2">
		<shadow type="colour_picker">
		<field name="COLOUR">#3333ff</field>
		</shadow>
		</value>
		<value name="RATIO">
		<shadow type="math_number">
		<field name="NUM">0.5</field>
		</shadow>
		</value>
		</block>
		</category>
		<sep/>
		<category colour="330" custom="VARIABLE" name="Variables"/>
		<category colour="290" custom="PROCEDURE" name="Functions"/>
		</xml>
	"""

	workspace = Blockly.inject('blocklyDiv', {trashcan: false, sounds: false, toolbox: toolbox})
	workspace.addChangeListener (event) ->
		updateCode() if $scope.showJs
		$scope.$digest()
