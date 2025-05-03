#!/usr/bin/env bash

npm i @moonbit/moonpad-monaco@latest
cp node_modules/@moonbit/moonpad-monaco/dist/{lsp-server.js,moonc-worker.js,moonpad-monaco.d.ts,moonpad-monaco.js,onig.wasm} moonpad-monaco/
git add moonpad-monaco/{lsp-server.js,moonc-worker.js,moonpad-monaco.d.ts,moonpad-monaco.js,onig.wasm} package.json package-lock.json
git commit -m 'update moonpad-monaco to latest version'
echo -e '\e[31m\nplease manually patch moonpad-monaco.js according to the following commit\n\e[00m'
git show 7f24cba
# git add moonpad-monaco/moonpad-monaco.js
# git cm -m 'patch moonpad-monaco.js'