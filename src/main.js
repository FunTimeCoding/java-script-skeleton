let $ = require('jquery');
let JavaScriptSkeleton = require('./JavaScriptSkeleton.js');

$().ready(function () {
    let application = new JavaScriptSkeleton();
    console.log(application.hello());
});
