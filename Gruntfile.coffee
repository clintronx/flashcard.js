module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-concat'

  grunt.registerTask 'default', ['coffee', 'watch']

  grunt.initConfig
    uglify: 
      options: 
        banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'
      build:
        src: 'src/cs/<%= pkg.name %>.coffee'
        dest: 'src/js/<%= pkg.name %>.min.js'
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