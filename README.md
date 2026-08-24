# Start

Personal start page built with [Skyline-Gazer/sui2](https://github.com/Skyline-Gazer/sui2).
The site configuration lives in `data.json`; the `sui2` submodule is pinned to a tested upstream commit so deployments remain reproducible.

## Build locally

```sh
git submodule update --init
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

Connect this repository to a Cloudflare Pages project with Git Integration. Cloudflare then builds every configured branch and adds preview URLs and deployment checks to pull requests without a separate GitHub Actions workflow.

Use these Pages build settings:

- Production branch: `master`
- Build command: `./build.sh`
- Build output directory: `sui2/dist`
- Root directory: `/`

The Node.js version is pinned in `.node-version`. No Cloudflare API credentials are stored in GitHub.
