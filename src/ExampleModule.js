// constructor
function ExampleModule() {
    this.returnCode = 0;
}

// module functions
ExampleModule.prototype.run = function () {
    console.log('Hello World');
    return this.returnCode;
};

// export the module
module.exports = ExampleModule;
