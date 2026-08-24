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

Use these values on the Cloudflare Pages **Build settings** screen:

- Framework preset: `None`
- Production branch: `master`
- Build command: `bash build.sh`
- Build output directory: `sui2/dist`
- Root directory (advanced): leave blank to use the repository root
- Environment variables (advanced): none required

The Node.js version is pinned to Node.js 26 in `.node-version`. The build script installs the `sui2` submodule dependencies and passes the repository-level `data.json` to the build. No Cloudflare API credentials are stored in GitHub.
