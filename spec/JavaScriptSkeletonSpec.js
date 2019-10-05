let ExampleModule = require('../src/JavaScriptSkeleton.js');

describe("JavaScriptSkeleton", function () {
    it("can greet the world", function () {
        let em = new ExampleModule();
        expect(em.hello()).toEqual("Hello friend.");
    });
});
