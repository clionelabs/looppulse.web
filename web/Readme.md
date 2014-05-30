#Development Guide

This website is built by gulp, based on yeoman generator `generator-gulp-webapp`. This readme file is located on where you should run the command below.

## Before everything

If something unchange after you run any gulp command, try:

1. Run `npm install` to install gulp and tool dependencies

2. Run `bower install` to install client side dependencies


## In Development

In order not to build everything manually, we have watch (or guard if you are rubyist) and live-reload

`gulp watch`

## Build the file

When you are ready to deploy, run:

`gulp build`

after the build end, run this command to copy it to `public/`

`gulp copy`

## survival note

- When your style(scss) have error(s), gulp watch will be terminated.
- If you see the script doesn't change after file saved, check the gulp watch terminal for coffee script error.
- If you got error message on `gulp-useref`, run `bower install` and even `npm install` for missing files.
- When you ***see change on `package.json` and `bower.json`***, run `npm install` and `bower install` respectively.
- If you see something like `EADDRINUSE` in your error message, reboot.