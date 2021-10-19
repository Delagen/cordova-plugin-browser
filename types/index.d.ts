interface BrowserPlugin {
    /**
     * Opens url in browser activity.
     *
     * @param url The url to open.
     *
     * @example
     * cordova.plugins.browserPlugin.open("https://google.com");
     */
    open(url: string): Promise<void>;
}

interface CordovaPlugins {
    browserPlugin: BrowserPlugin;
}
