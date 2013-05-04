module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask 'default', ['coffee', 'watch']

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
    watch:
      coffee:
        files: 'site/src/cs/**/*.coffee'
        tasks: ['coffee']
