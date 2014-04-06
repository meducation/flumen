module.exports = (grunt) ->

  coffeeFiles = [
    'routes/**/*.coffee'
    'lib/**/*.coffee'
    'app.coffee'
  ]

  grunt.initConfig
    express:
      dev:
        options:
          cmd: 'coffee'
          script: 'app.coffee'
          port: 3001

    coffeelint:
      files: coffeeFiles
      gruntfile: ['Gruntfile.coffee']

    watch:
      coffee:
        options:
          livereload: true
          nospawn: true
        files: [coffeeFiles, ['test/coffee/**/*.coffee']]
        tasks: ['express:dev', 'coffeelint:files']
    
  require('matchdep').filterDev('grunt-!(template)*').forEach grunt.loadNpmTasks

  grunt.registerTask 'server', 'Start a web server to host the app.',
    ['express:dev', 'watch']

  grunt.registerTask 'test', ['coffeelint']

  grunt.registerTask 'default', 'Run for first time setup.', ['coffeelint']