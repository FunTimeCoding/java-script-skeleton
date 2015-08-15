var JavaScriptSkeleton = require('./JavaScriptSkeleton.js');

var consoleMain = function() {
    this.returnCode = 0;
};

consoleMain.prototype.run = function () {
    var javaScriptSkeleton = new JavaScriptSkeleton();
    console.log(javaScriptSkeleton.hello());

    return this.returnCode;
};

module.exports = consoleMain;
