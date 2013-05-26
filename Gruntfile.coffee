module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-sass'
  # grunt.loadNpmTasks 'grunt-karma'
  grunt.loadNpmTasks 'grunt-istanbul'  
  grunt.loadNpmTasks 'grunt-coffeelint'

  grunt.registerTask 'default', ['coffeelint', 'coffee', 'sass', 'watch']

  COFFEE = [ 'site/src/cs/main/**/*.coffee', 'site/src/cs/test/spec/**/*.coffee' ]

  grunt.initConfig
    coffee:
      all:
        files: [
          expand: true
          cwd: 'site/src/cs/main/'
          src: '**/*.coffee'
          dest: 'site/src/js/main/'
          ext: '.js'
        ]
      tests:
        files: [
          expand: true
          cwd: 'site/src/cs/test/spec/'
          src: '**/*.coffee'
          dest: 'site/src/js/test/spec/'
          ext: '.js'
        ]
    sass:
      all:
        files: 
          'site/css/layout.css':'site/scss/layout.scss',
          'site/css/flashcard.css':'site/scss/flashcard.scss'
        options:
          style: 'expanded'
          unixNewlines: true          
    watch:
      coffee:
        files: COFFEE
        tasks: ['coffee']
      sass:
        files: 'site/scss/**/*.scss'
        tasks: ['sass']
      # karma:
      #   files: ['site/src/js/main/**/*.js', 'site/src/js/test/spec/**/*.js']
      #   tasks: ['karma:unit:run']
    coffeelint: 
      sources: COFFEE
      options:
        no_trailing_whitespace: 
          level: 'warn'
        indentation: 
          value: 2
          level: 'warn'
        max_line_length:
          value: 80
          level: 'ignore'
        no_backticks:
          level: 'warn'
        cyclomatic_complexity:
          value: 5
          level: 'warn'
        line_endings:
          value: 'unix' #'windows'
          level: 'ignore'
        newlines_after_classes:
          value: 1
          level: 'warn'
        arrow_spacing:
          level: 'warn'
