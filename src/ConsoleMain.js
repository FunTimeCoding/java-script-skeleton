let JavaScriptSkeleton = require('./JavaScriptSkeleton.js');

let consoleMain = function() {
    this.returnCode = 0;
};

consoleMain.prototype.run = function () {
    let javaScriptSkeleton = new JavaScriptSkeleton();
    console.log(javaScriptSkeleton.hello());

    return this.returnCode;
};

module.exports = consoleMain;
