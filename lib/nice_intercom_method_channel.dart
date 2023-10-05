import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'nice_intercom_platform_interface.dart';

/// An implementation of [NiceIntercomPlatform] that uses method channels.
class MethodChannelNiceIntercom extends NiceIntercomPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('nice_intercom');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
