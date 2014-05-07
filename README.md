# Flumen

A node application that passes Meducation messages onto the website via web sockets.

# Installation

## First Time Setup

    npm install -g coffee-script

## Per Installation

    npm install --production

# Usage

Before starting Flumen, export a secret e.g:

    export FLUMEN_SECRET=foobar

This is used for personal messages as part of a SHA1 hash.
The client must be able to provide the same hash in order to receive personal messages.
These messages are sent via rooms, keyed by user ID (which the client must also send).

Then start Flumen:

    npm start

Navigate to `http://localhost:3004/test` and open the developer console.

To test an incoming message POST:

    coffee bin/post-news-feed-item.coffee

In the browser test client, check the page for the message (it's also available in the console).

## Personal Messages

In the browser test client, enter a user ID and the hash and click 'handshake'.
Then send a personal message:

    coffee bin/post-notification.coffee

If allowed, the test client will receive the message both in the page and the console.

# Is it any good?

[Yes.](http://news.ycombinator.com/item?id=3067434)

## Contributing

Firstly, thank you!! :heart::sparkling_heart::heart:

We'd love to have you involved. Please read our [contributing guide](https://github.com/meducation/flumen/tree/master/CONTRIBUTING.md) for information on how to get stuck in.

### Contributors

This project is managed by the [Meducation team](http://company.meducation.net/about#team). 

These individuals have come up with the ideas and written the code that made this possible:

- [Ben Paddock](http://github.com/pads)
- [Charles Care](https://github.com/ccare)

## Licence

Copyright (C) 2013 New Media Education Ltd

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

A copy of the GNU Affero General Public License is available in [Licence.md](https://github.com/meducation/flumen/blob/master/LICENCE.md)
along with this program.  If not, see <http://www.gnu.org/licenses/>.
