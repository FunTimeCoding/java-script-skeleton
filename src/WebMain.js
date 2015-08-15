var $ = require('jquery');
var JavaScriptSkeleton = require('./JavaScriptSkeleton.js');

$().ready(function () {
    var application = new JavaScriptSkeleton();
    console.log(application.hello());
});
