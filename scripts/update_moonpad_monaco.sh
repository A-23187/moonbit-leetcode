#!/usr/bin/env bash

echo "check if @moonbit/moonpad-monaco is outdated"
current_version=$(npm view @moonbit/moonpad-monaco version)
latest_version=$(cat package.json | jq -r '.dependencies.["@moonbit/moonpad-monaco"]' | tr -d '^')
# outdated=$(npm outdated --json @moonbit/moonpad-monaco | jq '.["@moonbit/moonpad-monaco"] | (.current != .latest)')
if [ "$current_version" == "$latest_version" ]; then
    echo "@moonbit/moonpad-monaco is up to date"
    exit
fi
echo "update @moonbit/moonpad-monaco to latest version"
npm i @moonbit/moonpad-monaco@latest
cp node_modules/@moonbit/moonpad-monaco/dist/{lsp-server.js,moonc-worker.js,moonpad-monaco.d.ts,moonpad-monaco.js,onig.wasm} moonpad-monaco/
git add moonpad-monaco/{lsp-server.js,moonc-worker.js,moonpad-monaco.d.ts,moonpad-monaco.js,onig.wasm} package.json package-lock.json
git commit -m 'update moonpad-monaco to latest version'
echo "patch moonpad-monaco.js"
if [ "$(uname)" == Darwin ]; then
    sed -i '' 's/^import \* as \([a-zA-Z_][a-zA-Z0-9_]*\) from "monaco-editor-core";$/const \1 = globalThis.monaco;/' moonpad-monaco/moonpad-monaco.js
else
    sed -i 's/^import \* as \([a-zA-Z_][a-zA-Z0-9_]*\) from "monaco-editor-core";$/const \1 = globalThis.monaco;/' moonpad-monaco/moonpad-monaco.js
fi
git add moonpad-monaco/moonpad-monaco.js
git commit -m 'patch moonpad-monaco.js'
echo "git push to remote repository"
git push origin main
