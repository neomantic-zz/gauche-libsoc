# gauche-libsoc

A [gauche](http://practical-scheme.net/gauche/index.html)
library binding to the [libsoc](https://github.com/jackmitch/libsoc)
library.

## Features

Gauche-libsoc only supports a small set of calls that libsoc actually
provides. It only supports the manipulation of GPIO sockets via libsoc.

The following calls are provided by gauche-libsoc.

``` scheme
(gpio-request gpio gpio-mode)
```

Request (reserve, or export to sysfs) a gpio.  Possible values:

* `'shared` - From the original code: "If the gpio is already
  exported then it will not unexport the GPIO on free. If it is not
  exported, then unexport on free."

* `'greedy` - From the original code: the request "will
  succeed if the GPIO is already exported, but will always unexport
  the GPIO on free."

* `'weak` - From the original code: the request "will fail if
  GPIO is already exported, will always unexport on free."

``` scheme
(gpio-free gpio)
```
Free the gpio, under the conditions of the gpio-modes described above.

``` scheme
(gpio-direction-set! gpio gpio-direction)
```
Set the direction of the gpio

Direction values are the following: `'output`,
`'input`, `'error`

``` scheme
(gpio-level-set! gpio gpio-level)
```
Set the level of the gpio. Level values ar the following:
`'high`, `'low`, `'error`.

## Install
### Prerequisites
* [gauche-scheme](http://practical-scheme.net/gauche/index.html)
* [libsoc](https://github.com/jackmitch/libsoc) (If you're using a
  debian-based distribution, please install the dev package as well as
  the libsoc package.)
* gauche development files. These are included if you choose to
  manually install gauche-scheme.  If you are using a debian based system
  install `gauche-dev`
* autoconf, make, and related build tools

### Build
1. autoreconf -vfi
2. ./configure
3. make all
4. sudo make install

To test if installation work - `gauche-package list` - and you should see
`gauche-libsoc 0.0.1`

## Usage
Include the module as follows:

``` scheme
(use ext.libsoc)
```

## Example
An example ships with the source code. The example must run
as root since libsoc needs echo strings to the gpio sysfs interface.

`sudo gosh example.scm`

## Author

[Chad Albers](mailto:calbers@neomantic.com)

## License

Like chibi-scheme, chibi-libsoc is licensed under the terms of the 3-clause
BSD license.  Consult the LICENSE document for the full license.
