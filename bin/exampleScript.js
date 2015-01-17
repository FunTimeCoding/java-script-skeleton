#!/usr/bin/env node

var ConsoleMain = require('../src/ConsoleMain.js');
var em = new ConsoleMain();
var exitCode = em.run();

process.exit(code = exitCode);
