module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask 'default', ['coffee', 'watch']

  grunt.initConfig
    coffee:
      all:
        files: [
          expand: true
          cwd: 'src/cs/'
          src: '**/*.coffee'
          dest: 'src/js/'
          ext: '.js'
        ]
    watch:
      coffee:
        files: 'src/cs/**/*.coffee'
        tasks: ['coffee']
