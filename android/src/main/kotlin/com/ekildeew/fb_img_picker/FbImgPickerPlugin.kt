package com.ekildeew.fb_img_picker

import android.app.Activity
import android.content.Intent
import com.mbieniek.facebookimagepicker.facebook.FACEBOOK_IMAGE_ACTIVITY_REQUEST_CODE
import com.mbieniek.facebookimagepicker.facebook.FacebookAlbumPickerActivity
import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

class FbImgPickerPlugin: MethodCallHandler {

  var activity: Activity? = null

  constructor(registrar: Registrar) {
    this.activity = registrar.activity()
  }

  companion object {

    @JvmStatic
    fun registerWith(registrar: Registrar) {
      registrar.activity()
      val channel = MethodChannel(registrar.messenger(), "fb_img_picker")
      channel.setMethodCallHandler(FbImgPickerPlugin(registrar))
    }

  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "pickImage") {

      val intent = Intent(activity, FacebookAlbumPickerActivity::class.java)
      activity?.startActivityForResult(intent, FACEBOOK_IMAGE_ACTIVITY_REQUEST_CODE)

      //result.success("ok")
    } else {
      result.notImplemented()
    }
  }
}
