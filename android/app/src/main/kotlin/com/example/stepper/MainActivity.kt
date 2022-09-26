package com.example.stepper

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import org.json.JSONArray

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.example.stepper/stepper_data"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            call, result ->
            val jsonObject = JSONArray(listOf(
                    mapOf("title" to "Select campaign settings",
                            "content" to "For each ad campaign that you create, you can control " +
                                    "how much you're willing to spend on clicks and " +
                                    "conversions, which networks and geographical locations " +
                                    "you want your ads to show on, and more."
                    ),
                    mapOf("title" to "Create an ad group"),
                    mapOf("title" to "Create an ad", "subtitle" to "Last step",
                            "content" to "Try out different ad text to see what brings in the most " +
                            "customers, and learn how to enhance your ads using " +
                            "features like ad extensions. If you run into any problems " +
                            "with your ads, find out how to tell if they’re running " +
                            "and how to resolve approval issues."
                    ),
                ))

            if (call.method == "getStepperData") {
                result.success(jsonObject.toString())
            } else {
                result.notImplemented()
            }
        }
    }
}
