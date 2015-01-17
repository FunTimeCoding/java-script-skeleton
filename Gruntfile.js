module.exports = function (grunt) {
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),
        jasmine_node: {
            options: {
                forceExit: true,
                match: '.',
                matchall: false,
                extensions: 'js',
                specNameMatcher: 'spec',
                jUnit: {
                    report: true,
                    savePath: "build/log",
                    useDotNotation: true,
                    consolidate: true
                }
            },
            all: ['spec']
        },
        jshint: {
            all: [
                'Gruntfile.js',
                'src/**/*.js',
                'spec/**/*.js'
            ],
            options: {
                reporter: 'checkstyle',
                reporterOutput: 'build/log/checkstyle-result.xml'
            }
        },
        browserify: {
            vendor: {
                src: [],
                dest: 'build/vendor.js',
                options: {
                    require: ['jquery']
                }
            },
            app: {
                src: ['src/**/*.js'],
                dest: 'build/app.js',
                options: {
                    external: ['jquery']
                }
            }
        },
        concat: {
            'web/main.js': ['build/vendor.js', 'build/app.js']
        },
        watch: {
            files: ['<%= jshint.files %>'],
            tasks: ['jshint', 'jasmine_node']
        }
    });

    grunt.loadNpmTasks('grunt-jasmine-node');
    grunt.loadNpmTasks('grunt-contrib-jshint');
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.loadNpmTasks('grunt-contrib-concat');
    grunt.loadNpmTasks('grunt-browserify');
    grunt.registerTask('web', ['browserify', 'concat']);
    grunt.registerTask('default', ['jshint', 'jasmine_node']);
};
