wpszchk
=======

This is web page size checking tool, that can help you monitor your web pages.

Features
-------
 - Measuring full page size, with the images, JS and other stuff
 - Limit the download time (returns 0 if time is up)

How to use
-------

Usage:
```
./getwpsize  URL timeout
```

Example:
```
./getwpsize 'http://google.com/' 2
```

The "timeout" is optional. Default value is 9 seconds.

Requirements
-------
 - Node.JS

Included 3rd part software
-------
 - Phantom.JS (v1.9.0)
 - yslow.js

Supported (tested) platforms
-------
 - Ubuntu server 12.10 x64
