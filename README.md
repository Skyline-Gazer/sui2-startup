# Start

Personal start page built with [Skyline-Gazer/sui2](https://github.com/Skyline-Gazer/sui2).
The site configuration lives in `data.json`; the `sui2` submodule is pinned to a tested upstream commit so deployments remain reproducible.

## Build locally

```sh
git submodule update --init
npm install --prefix sui2
./build.sh
```

The generated static site is written to `sui2/dist`.

## Update sui2

```sh
git -C sui2 fetch origin master
git -C sui2 checkout origin/master
git add sui2
```

Commit the updated submodule reference only after running `./build.sh` successfully.

## Deployment

GitHub Actions builds the site with Node.js 22 and deploys `sui2/dist` to the Cloudflare Pages project named `start`. Pull requests create preview deployments; pushes to `master` update production.

The repository requires the `CLOUDFLARE_API_TOKEN` and `CLOUDFLARE_ACCOUNT_ID` Actions secrets.
