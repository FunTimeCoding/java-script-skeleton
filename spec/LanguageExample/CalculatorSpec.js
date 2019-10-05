let Calculator = require('../../src/LanguageExample/Calculator.js');

describe("Calculator", function () {
    it("can add numbers", function () {
        let c = new Calculator();
        expect(c.add(1, 2)).toEqual(3);
    });
});
