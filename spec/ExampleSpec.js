var ExampleModule = require('../src/ExampleModule.js');

describe("ExampleModule", function () {
    it("can greet the world", function () {
        var em = new ExampleModule();
        expect(em.hello()).toEqual("hello world");
    });
});
