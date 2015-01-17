function ExampleModule() {
    this.name = 'world';
}

ExampleModule.prototype.hello = function () {
    return 'hello ' + this.name;
};

module.exports = ExampleModule;
