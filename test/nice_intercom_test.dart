import 'package:flutter_test/flutter_test.dart';
import 'package:nice_intercom/nice_intercom.dart';
import 'package:nice_intercom/nice_intercom_platform_interface.dart';
import 'package:nice_intercom/nice_intercom_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockNiceIntercomPlatform
    with MockPlatformInterfaceMixin
    implements NiceIntercomPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final NiceIntercomPlatform initialPlatform = NiceIntercomPlatform.instance;

  test('$MethodChannelNiceIntercom is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelNiceIntercom>());
  });

  test('getPlatformVersion', () async {
    // NiceIntercom niceIntercomPlugin = NiceIntercom();
    // MockNiceIntercomPlatform fakePlatform = MockNiceIntercomPlatform();
    // NiceIntercomPlatform.instance = fakePlatform;
    //
    // expect(await niceIntercomPlugin.getPlatformVersion(), '42');
  });
}
