## Description

The Movie Database ([TMDB](https://www.themoviedb.org/)) application based on [Kopytko framework](https://github.com/getndazn/kopytko-framework).


## Requirements
- node >= 16
- npm >= 8

## Installation

```bash
$ npm ci
```

## Configration
Please create `.env` file into root folder and copy below configuration.

```
ROKU_IP=<required>
ROKU_DEV_USER=<required>
ROKU_DEV_PASSWORD=<required>

ROKU_DEV_ID=<optional>
ROKU_DEV_SIGNING_PASSWORD=<optional>

API_KEY=<required>
```

## How to start

To start application run npm command:

```bash
$ npm run start
```

## Scripts

- `npm run build` - build app into dist folder
- `npm run start` - start app on the device
- `npm run test` - run unit tests on the device
- `npm run lint` - checks code with eslint
- `npm run package` - creates signed app package

For more information please visit [Kopytko framework](https://github.com/getndazn/kopytko-framework) page.
