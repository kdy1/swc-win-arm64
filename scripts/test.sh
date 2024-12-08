#!/usr/bin/env bash
set -eu

# Install wasm-pack
curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | sh

# Clone swc
git clone https://github.com/swc-project/swc.git -b swc-win-arm64
cd swc

# Install dependencies
corepack enable
yarn

# Test wasm
(cd ./bindings/binding_typescript_wasm && ./scripts/build.sh && ./scripts/test.sh && node nodejs-patched.mjs)
