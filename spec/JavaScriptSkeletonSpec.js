var ExampleModule = require('../src/JavaScriptSkeleton.js');

describe("JavaScriptSkeleton", function () {
    it("can greet the world", function () {
        var em = new ExampleModule();
        expect(em.hello()).toEqual("Hello friend.");
    });
});
