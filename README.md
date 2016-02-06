# JavaScriptSkeleton

## Usage

This section explains how to use this project.

Run the main entry point program.

```sh
bin/jss
```


## Development

This section explains how to use scripts that are intended to ease the development of this project.

Install dependencies and develoment tools.

```sh
npm install
```

Run style check and tests.

```sh
./run-style-check.sh
./run-tests.sh
```

Compile JS code for web deployment, generating `web/main.js`.

```sh
./grunt.sh build
```

Build the project like Jenkins.

```sh
./build.sh
```


## Important details

* The script `grunt.sh` is a wrapper script intended for ease of use.
* The directories `src/LanguageExample` and `spec/LanguageExample` are for sharing language specific knowledge.
