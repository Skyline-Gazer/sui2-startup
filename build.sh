#!/usr/bin/env bash

set -euo pipefail

pushd sui2 >/dev/null
DATA_FILE=../data.json npm run build
popd >/dev/null
