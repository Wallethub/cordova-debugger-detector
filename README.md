DebuggerAttachmentDetector
===========================

Cordova / Phonegap plugin for detecting debugger attachment.

## Supported Platforms

- iOS

## Installation

#### Latest version from GitHub

```
cordova plugin add https://github.com/Wallethub/cordova-debugger-detector.git
```

## Usage

### ``.enable(seconds,success,failed)``

Enable detection. All parameters are optional and if no ``seconds`` are specified it defaults to 5.

```javascript
DebuggerAttachmentDetector.enable(10,function(){
  console.log("detection activated")
},function(){
  console.log("can't activate detector");
})
```

### ``.disable(success,failed)``

Disable detection.

```javascript
DebuggerAttachmentDetector.disable(function(){
  console.log("detection deactivated")
},function(){
  console.log("can't deactivate detector");
})
```

## License

MIT Licensed

Copyright (c) 2016, wallethub.com <api@evolutionfinance.com>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
