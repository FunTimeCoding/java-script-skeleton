# JavaScript Skeleton


## Operation

Run scripts.

```sh
bin/example-script
```


## Testing

Install dependencies and test tools.

```sh
npm install
```

Run code lint check and tests.

```sh
./run-lint-check.sh
./run-tests.sh
```

Compile JS code for web deployment, generating `web/main.js`.

```sh
./grunt.sh build
```

Build project like Jenkins.

```sh
./build.sh
```


## Important details

* The script `grunt.sh` is a wrapper script intended for ease of use.
* The directories `src/LanguageExample` and `spec/LanguageExample` are for sharing language specific knowledge.
