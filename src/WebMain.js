var $ = require('jquery');
var ExampleModule = require('./ExampleModule.js');

$().ready(function () {
    var em = new ExampleModule();
    console.log(em.hello());
});
