var exec = require('cordova/exec');
/**
 * Constructor
 */
function DebuggerAttachmentDetector() { }

DebuggerAttachmentDetector.prototype.enable = function (seconds,success,fail) {
  if(!seconds) seconds = 5;
  exec(function (result) {
    // result handler
    if(success && typeof success == "function") success(result);
  },
    function (error) {
      // error handler
      if(fail && typeof fail == "function") fail(result);
    },
    "DebuggerAttachmentDetector",
    "enable",
    [seconds]
  );
}
DebuggerAttachmentDetector.prototype.disable = function (success,fail) {
  exec(function (result) {
    // result handler
    if(success && typeof success == "function") success(result);
  },
    function (error) {
      // error handler
      if(fail && typeof fail == "function") fail(result);
    },
    "DebuggerAttachmentDetector",
    "disable",
    []
  );
}

module.exports = new DebuggerAttachmentDetector();