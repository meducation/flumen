module.exports = (grunt) ->

  srcFiles = [
    'routes/**/*.coffee'
    'lib/**/*.coffee'
    'app.coffee'
  ]

  testFiles = [
    'spec/**/*.coffee'
  ]

  grunt.initConfig
    express:
      dev:
        options:
          opts: ['node_modules/coffee-script/bin/coffee']
          script: 'app.coffee'
          port: 3004

    coffeelint:
      files: srcFiles
      specs: testFiles
      gruntfile: ['Gruntfile.coffee']

    jasmine_node:
      options:
        coffee: true
        extensions: 'coffee',
        specNameMatcher: 'spec',
      all: ['spec/']

    watch:
      coffee:
        options:
          livereload: true
          nospawn: true
        files: [srcFiles, testFiles]
        tasks: ['test']
    
  require('matchdep').filterDev('grunt-!(template)*').forEach grunt.loadNpmTasks

  grunt.registerTask 'server', 'Start a web server to host the app.',
    ['express:dev', 'watch']

  grunt.registerTask 'test', ['coffeelint', 'jasmine_node']

  grunt.registerTask 'default', 'Run for first time setup.', ['coffeelint']