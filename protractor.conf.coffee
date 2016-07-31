
exports.config =

  allScriptsTimeout: 11000

  specs: [
    'e2e/*.coffee'
  ]

  capabilities:
    'browserName': 'chrome'

  directConnect: true

  baseUrl: 'http://localhost:3000/'

  framework: 'jasmine'
