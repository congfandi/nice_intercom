import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'nice_intercom_method_channel.dart';

abstract class NiceIntercomPlatform extends PlatformInterface {
  /// Constructs a NiceIntercomPlatform.
  NiceIntercomPlatform() : super(token: _token);

  static final Object _token = Object();

  static NiceIntercomPlatform _instance = MethodChannelNiceIntercom();

  /// The default instance of [NiceIntercomPlatform] to use.
  ///
  /// Defaults to [MethodChannelNiceIntercom].
  static NiceIntercomPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [NiceIntercomPlatform] when
  /// they register themselves.
  static set instance(NiceIntercomPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
