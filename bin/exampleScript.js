#!/usr/bin/env node

var ExampleModule = require('../src/ExampleModule.js');
var em = new ExampleModule();
var exitCode = em.run();

process.exit(code = exitCode);
