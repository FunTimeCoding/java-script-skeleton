module.exports = function (grunt) {
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),
        jasmine_nodejs: {
            options: {
                specNameSuffix: "Spec.js",
                helperNameSuffix: "Helper.js",
                reporters: {
                    console: {
                        colors: true,
                        cleanStack: true,
                        verbose: true
                    }
                },
            },
            your_target: {
                specs: [
                    "spec/**"
                ],
                helpers: [
                    "spec/**"
                ]
            }
        },
        jshint: {
            all: [
                'Gruntfile.js',
                'src/**/*.js',
                'spec/**/*.js'
            ],
            options: {
                esversion: 6,
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
        }
    });

    grunt.loadNpmTasks('grunt-jasmine-nodejs');
    grunt.loadNpmTasks('grunt-contrib-jshint');
    grunt.loadNpmTasks('grunt-contrib-concat');
    grunt.loadNpmTasks('grunt-browserify');
    grunt.registerTask('build', ['browserify', 'concat']);
    grunt.registerTask('default', ['jshint', 'jasmine_nodejs']);
};
