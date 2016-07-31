
describe 'blockly quiz', () ->
	beforeAll () ->
		browser.get '/'

	it 'should have title Blockly Quiz', () ->
		expect(browser.getTitle()).toEqual 'Blockly Quiz'

	it 'should have question 1', () ->
		expect(element(By.binding('question.title')).getText()).toBe 'Initialize a Global Variable'

	it 'should have question 2', (done) ->
		element(By.className('glyphicon-chevron-right')).click().then () ->
			expect(element(By.binding('question.title')).getText()).toBe 'Using If Statement'
			done()

	it 'should go back to question 1', (done) ->
		element(By.className('glyphicon-chevron-left')).click().then () ->
			expect(element(By.binding('question.title')).getText()).toBe 'Initialize a Global Variable'
			done()
