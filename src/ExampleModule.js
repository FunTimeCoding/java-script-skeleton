// constructor
function ExampleModule() {
    this.returnCode = 0;
}

// class methods
ExampleModule.prototype.run = function () {
    console.log('Hello World');
    return this.returnCode;
};

// export the class
module.exports = ExampleModule;
