const exec = require("cordova/exec");

module.exports.open = function(url, success, error) {
    exec(success, error, "BrowserPlugin", "open", [url]);
};
