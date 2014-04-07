# Flumen

A node application that passes Meducation messages onto the website via web sockets.

# Installation

## First Time Setup

    npm install -g coffee-script

## Per Installation

    npm install --production

# Usage

    npm start

Create and server a test client (see `test-client.html`).

To test an incoming message POST:

    ./bin/post-message

In the browser developer console on the test client page, check for an incoming item.

# Contributing

    npm install -g grunt-cli
    npm install
    grunt

To run the server that auto-restarts when changes are made, run:

    grunt server

## Testing

    npm install -g jasmine-node
    grunt test