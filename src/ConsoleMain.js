var ExampleModule = require('./ExampleModule.js');

var consoleMain = function() {
    this.returnCode = 0;
};

consoleMain.prototype.run = function () {
    var em = new ExampleModule();
    console.log(em.hello());

    return this.returnCode;
};

module.exports = consoleMain;
