//
//  Generated file. Do not edit.
//

// clang-format off

#import "GeneratedPluginRegistrant.h"

#if __has_include(<ed_screen_recorder/EdScreenRecorderPlugin.h>)
#import <ed_screen_recorder/EdScreenRecorderPlugin.h>
#else
@import ed_screen_recorder;
#endif

#if __has_include(<path_provider_foundation/PathProviderPlugin.h>)
#import <path_provider_foundation/PathProviderPlugin.h>
#else
@import path_provider_foundation;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [EdScreenRecorderPlugin registerWithRegistrar:[registry registrarForPlugin:@"EdScreenRecorderPlugin"]];
  [PathProviderPlugin registerWithRegistrar:[registry registrarForPlugin:@"PathProviderPlugin"]];
}

@end
