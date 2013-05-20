module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-istanbul'

  grunt.registerTask 'default', ['coffee', 'sass', 'watch']

  grunt.initConfig
    coffee:
      all:
        files: [
          expand: true
          cwd: 'site/src/cs/'
          src: '**/*.coffee'
          dest: 'site/src/js/'
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
        files: 'site/src/cs/**/*.coffee'
        tasks: ['coffee']
      sass:
        files: 'site/scss/**/*.scss'
        tasks: ['sass']
