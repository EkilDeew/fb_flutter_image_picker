#import "FbImgPickerPlugin.h"
#import <fb_img_picker/fb_img_picker-Swift.h>

@implementation FbImgPickerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFbImgPickerPlugin registerWithRegistrar:registrar];
}
@end
