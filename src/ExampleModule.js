var exampleModule = function() {
    this.name = 'world';
};

exampleModule.prototype.hello = function () {
    return 'hello ' + this.name;
};

module.exports = exampleModule;
