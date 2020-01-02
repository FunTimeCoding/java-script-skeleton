// TODO: https://github.com/gulpjs/gulp/blob/master/docs/recipes/browserify-with-globs.md
'use strict';

let watchify = require('watchify');
let browserify = require('browserify');
let gulp = require('gulp');
let source = require('vinyl-source-stream');
let buffer = require('vinyl-buffer');
let log = require('gulplog');
let sourcemaps = require('gulp-sourcemaps');
let assign = require('lodash.assign');

let b = watchify(
    browserify(
        assign(
            {},
            watchify.args,
            {
                entries: [
                    'src/main.js',
                    'spec/JavaScriptSkeletonSpec.js',
                    'spec/LanguageExample/CalculatorSpec.js',
                ],
                debug: true
            }
        )
    )
);

gulp.task('js', bundle);
b.on('update', bundle);
b.on('log', log.info);

function bundle() {
    return b.bundle()
        .on('error', log.error.bind(log, 'Browserify Error'))
        .pipe(source('main.js'))
        .pipe(buffer())
        .pipe(sourcemaps.init({loadMaps: true}))
        .pipe(sourcemaps.write('./'))
        .pipe(gulp.dest('web'));
}

let jasmineBrowser = require('gulp-jasmine-browser');

// TODO: Test does not work yet because the spec uses require(). Compile specs first?
gulp.task('test', function () {
    return gulp.src(['web/main.js'])
        .pipe(jasmineBrowser.specRunner())
        .pipe(jasmineBrowser.server({port: 8888}));
});

gulp.task('test-headless', function () {
    return gulp.src(['web/main.js'])
        .pipe(jasmineBrowser.specRunner({console: true}))
        .pipe(jasmineBrowser.headless({driver: 'chrome'}));
});


let jshint = require("gulp-jshint");

gulp.task('lint', function () {
    return gulp.src(['src/**/*.js', 'spec/**/*Spec.js'])
        .pipe(jshint({
            esversion: 6,
        }))
        .pipe(jshint.reporter('default'));
});

gulp.task("lint-html", function () {
    return gulp.src(['src/**/*.js', 'spec/**/*Spec.js'])
        .pipe(jshint({
            esversion: 6,
        }))
        .pipe(
            jshint.reporter("gulp-jshint-html-reporter", {
                filename: __dirname + "/jshint-output.html",
                createMissingFolders: false
            })
        );
});

let checkstyleReporter = require('gulp-jshint-checkstyle-reporter');

gulp.task('lint-checkstyle', function () {
    return gulp.src(['src/**/*.js', 'spec/**/*Spec.js'])
        .pipe(jshint({
            esversion: 6,
        }))
        .pipe(checkstyleReporter())
        .pipe(gulp.dest('build/log/jshint'));
});
