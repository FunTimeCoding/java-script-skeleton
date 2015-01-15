var ExampleModule = require('../src/ExampleModule.js');

describe("ExampleModule", function () {
    it("contains spec with an expectation", function () {
        expect(true).toBe(true);
    });

    it("can be instantiated", function () {
        var em = new ExampleModule();
        expect(typeof em).toEqual("object");
    });

    it("can be ran", function () {
        var em = new ExampleModule();
        expect(em.run()).toEqual(0);
    });
});
