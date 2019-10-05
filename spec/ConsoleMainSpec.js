let ConsoleMain = require('../src/ConsoleMain.js');

describe("ConsoleMain", function () {
    it("can be instantiated", function () {
        let application = new ConsoleMain();
        expect(typeof application).toEqual("object");
    });

    it("can be run", function () {
        let application = new ConsoleMain();
        expect(application.run()).toEqual(0);
    });
});
