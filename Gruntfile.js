module.exports = function (grunt) {
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),
        jshint: {
            all: [
                'Gruntfile.js',
                'src/**/*.js',
                'spec/**/*.js',
            ],
            options: {
                esversion: 6,
            },
        },
        jasmine: {
            src: 'src/**/*.js',
            options: {
                specs: 'spec/**/*Spec.js',
                // helpers: 'spec/*Helper.js',
                // host: 'http://127.0.0.1:8000/',
                // template: require('grunt-template-jasmine-requirejs'),
            }
        },
        karma: {
            unit: {
                options: {
                    files: [
                        'spec/**/*Spec.js'
                    ],
                    frameworks: ['jasmine', 'requirejs'],
                    browsers: ['ChromeHeadless'],
                    singleRun: true,
                    basePath: '',
                }
            }
        },
        browserify: {
            vendor: {
                src: [],
                dest: 'build/vendor.js',
                options: {
                    require: [
                        'jquery',
                    ],
                },
            },
            app: {
                src: [
                    'src/**/*.js',
                ],
                dest: 'build/app.js',
                options: {
                    external: [
                        'jquery',
                    ],
                },
            },
        },
        concat: {
            'web/main.js': [
                'build/vendor.js',
                'build/app.js',
            ],
        },
    });

    grunt.loadNpmTasks('grunt-contrib-jasmine');
    grunt.loadNpmTasks('grunt-contrib-jshint');
    grunt.loadNpmTasks('grunt-contrib-concat');
    grunt.loadNpmTasks('grunt-browserify');
    grunt.loadNpmTasks('grunt-karma');
    grunt.registerTask(
        'build',
        [
            'browserify',
            'concat',
        ]
    );
    grunt.registerTask(
        'test',
        [
            'jasmine',
        ]
    );
    grunt.registerTask(
        'check',
        [
            'jshint',
        ]
    );
    grunt.registerTask(
        'default',
        [
            'test',
            'check',
        ]
    );
};
