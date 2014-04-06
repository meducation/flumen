# Flumen

A node application that passes Meducation messages onto the website via web sockets.

# Installation

## First Time Setup

    npm install -g coffee-script

## Per Installation

    npm install --production

# Usage

    npm start

Send a plain text POST to /message containing a valid SNS payload to test.

# Contributing

    npm install -g grunt-cli
    npm install
    grunt

To run the server that auto-restarts when changes are made, run:

    grunt server

## Testing

    npm install -g jasmine-node
    grunt test