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

Enable detections. All parameters are optional and if no ``seconds`` are specified it defaults to 5.

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
DebuggerAttachmentDetector.enable(10,function(){
  console.log("detection deactivated")
},function(){
  console.log("can't deactivate detector");
})
```
