#!/usr/bin/env bash

npm i @moonbit/moonpad-monaco@latest
cp node_modules/@moonbit/moonpad-monaco/dist/{lsp-server.js,moonc-worker.js,moonpad-monaco.d.ts,moonpad-monaco.js,onig.wasm} moonpad-monaco/
git add moonpad-monaco/{lsp-server.js,moonc-worker.js,moonpad-monaco.d.ts,moonpad-monaco.js,onig.wasm} package.json package-lock.json
git commit -m 'update moonpad-monaco to latest version'
echo -e '\e[31m\nplease manually patch moonpad-monaco.js according to the following commit\n\e[00m'
sed -i '' 's/^import \* as \([a-zA-Z_][a-zA-Z0-9_]*\) from "monaco-editor-core";$/const \1 = globalThis.monaco;/' moonpad-monaco/moonpad-monaco.js
git add moonpad-monaco/moonpad-monaco.js
git cm -m 'patch moonpad-monaco.js'
