var ConsoleMain = require('../src/ConsoleMain.js');

describe("ConsoleMain", function () {
    it("can be instantiated", function () {
        var application = new ConsoleMain();
        expect(typeof application).toEqual("object");
    });

    it("can be run", function () {
        var application = new ConsoleMain();
        expect(application.run()).toEqual(0);
    });
});
