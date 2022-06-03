package com.luci.nl_web

import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);

        // custom method to get flavor
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "flavor").setMethodCallHandler { call, result ->
            result.success(BuildConfig.FLAVOR)
        }
    }
}