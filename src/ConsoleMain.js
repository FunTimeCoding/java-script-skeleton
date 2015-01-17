var ExampleModule = require('./ExampleModule.js');

function ConsoleMain() {
    this.returnCode = 0;
}

ConsoleMain.prototype.run = function () {
    var em = new ExampleModule();
    console.log(em.hello());

    return this.returnCode;
};

module.exports = ConsoleMain;
