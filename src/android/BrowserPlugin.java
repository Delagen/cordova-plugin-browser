package com.delagen.cordova.browser;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.provider.Browser;

import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CallbackContext;

import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONArray;

public class BrowserPlugin extends CordovaPlugin {
    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        switch (action) {
            case "open":
                Uri uri = Uri.parse(args.getString(0));
                Context context = this.cordova.getActivity();
                Intent intent = new Intent(Intent.ACTION_VIEW);
                intent.setData(uri);
                intent.putExtra(Browser.EXTRA_APPLICATION_ID, context.getPackageName());
                context.startActivity(intent);
                callbackContext.success();
                return true;
            default:
                callbackContext.error("N/A");
                return false;
        }
    }
}
