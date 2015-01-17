var ConsoleMain = require('../src/ConsoleMain.js');

describe("ConsoleMain", function () {
    it("can be instantiated", function () {
        var cm = new ConsoleMain();
        expect(typeof cm).toEqual("object");
    });

    it("can be run", function () {
        var cm = new ConsoleMain();
        expect(cm.run()).toEqual(0);
    });
});
