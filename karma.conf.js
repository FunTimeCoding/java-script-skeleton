module.exports = function (config) {
    config.set({
        basePath: '',
        frameworks: ['jasmine', 'requirejs'],
        files: [
            {pattern: 'lib/**/*.js', included: false},
            {pattern: 'src/*.js', included: false},
            {pattern: 'spec/**/*Spec.js', included: false},
            'spec/test-main.js'
        ],
        exclude: [
            'src/main.js'
        ],
        preprocessors: {},
        reporters: ['progress'],
        port: 8000,
        colors: true,
        logLevel: config.LOG_INFO,
        autoWatch: true,
        browsers: ['ChromeHeadless'],
        singleRun: false,
        concurrency: Infinity
    })
};
