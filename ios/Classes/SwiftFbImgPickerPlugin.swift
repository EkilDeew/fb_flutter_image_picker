import Flutter
import UIKit
import GBHFacebookImagePicker

public class SwiftFbImgPickerPlugin: NSObject, FlutterPlugin, FacebookImagePickerDelegate {
    
    var imagesUrls = [String]()
    
    var result: FlutterResult?
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "fb_img_picker", binaryMessenger: registrar.messenger())
        let instance = SwiftFbImgPickerPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        self.result = result
        if call.method == "pickImage" {
            if let window = UIApplication.shared.delegate?.window, let vc = window?.rootViewController {
                let picker = FacebookImagePicker()
                picker.presentFacebookAlbumImagePicker(from: vc, delegate: self)
                UIApplication.shared.statusBarStyle = .default
            }
        }
    }
    
    public func facebookImagePicker(imagePicker: UIViewController,
                                    successImageModels: [FacebookImage],
                                    errorImageModels: [FacebookImage],
                                    errors: [Error?]) {
        if successImageModels.count != 1 {
            self.result?(FlutterError(code: "urlNbr", message: "Incorrect Photos number : \(successImageModels.count)", details: nil))
            return
        }
        self.result?(successImageModels[0].fullSizeUrl)
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    public func facebookImagePicker(imagePicker: UIViewController, didFailWithError error: Error?) {
       // self.result?(FlutterError(code: "canceled", message: error?.localizedDescription, details: nil))
        print("error")
        print(error?.localizedDescription)
        if let err = error {
            self.result?("error : \(err.localizedDescription)")
        } else {
            self.result?("unknow error")
        }
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    public func facebookImagePickerDismissed() {
    }
    
    public func facebookImagePicker(didCancelled imagePicker: UIViewController) {
        UIApplication.shared.statusBarStyle = .lightContent
    }

}
