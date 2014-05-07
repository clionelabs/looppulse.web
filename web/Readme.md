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