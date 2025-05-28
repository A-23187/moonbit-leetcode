# MoonBit ❤️ LeetCode

A browser extension to add support of moonbit language to leetcode, allowing you to solve leetcode problems using moonbit

![MoonBit ❤️ LeetCode](https://github.com/user-attachments/assets/99d4b03b-3257-4cfd-94c6-8a6e87db53ed)

## Features

1. Support syntax highlighting, code completion, and hover hints
2. Support running and submitting your solutions written in moonbit, by compiling to javascript

## How to use

### Tampermonkey script

1. Install [tampermonkey](https://www.tampermonkey.net) extension in your browser
2. Install [moonbit-leetcode.js](https://greasyfork.org/en/scripts/533641-moonbit-leetcode)

### Microsoft Edge extension

Install from https://microsoftedge.microsoft.com/addons/detail/jbjbplbebmpbbepanapebfigkgjedgjl. Or clone this repository to load manually, see more [here](https://learn.microsoft.com/en-us/microsoft-edge/extensions-chromium/getting-started/extension-sideloading)

### Google Chrome extension

Clone this repository to load manually, see more [here](https://developer.chrome.com/docs/extensions/get-started/tutorial/hello-world#load-unpacked)

## Change logs

<details>

### 1.1.2

1. For moonbit, support reset to default code

### 1.1.1

1. Fix

### 1.1.0

1. Support installation as Microsoft Edge or Google Chrome extension

### 1.0.2

1. Use the localStorage of browser to persist the moonbit code
2. When switch language from moonbit to others, restore their code

### 1.0.1

1. Annotate the moonbit source code as comments in the compilied javascript code

</details>

## Credits

- [moonbit/moonpad-monaco](https://www.npmjs.com/package/@moonbit/moonpad-monaco)
- [microsoft/monaco-editor](https://microsoft.github.io/monaco-editor/typedoc/index.html)

## License

[MIT License](https://github.com/A-23187/moonbit-leetcode/blob/main/LICENSE)
