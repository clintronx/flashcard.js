module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-sass'
  # grunt.loadNpmTasks 'grunt-karma'
  grunt.loadNpmTasks 'grunt-istanbul'  
  grunt.loadNpmTasks 'grunt-coffeelint'

  grunt.registerTask 'default', ['coffeelint', 'coffee', 'sass', 'watch']

  COFFEE = [ 'site/src/main/cs/**/*.coffee', 'site/src/test/cs/spec/**/*.coffee' ]

  grunt.initConfig
    coffee:
      all:
        files: [
          expand: true
          cwd: 'site/src/main/cs/'
          src: '**/*.coffee'
          dest: 'site/src/main/js/'
          ext: '.js'
        ]
      tests:
        files: [
          expand: true
          cwd: 'site/src/test/cs/spec/'
          src: '**/*.coffee'
          dest: 'site/src/test/js/spec/'
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
      #   files: ['site/src/main/js/**/*.js', 'site/src/test/js/spec/**/*.js']
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
