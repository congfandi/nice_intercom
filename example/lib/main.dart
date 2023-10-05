import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:nice_intercom/nice_intercom.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    NiceIntercom.instance.initialize(
      'bx1ckwyf',
      androidApiKey: 'android_sdk-b9a36f4f91a88d0157d90bae856ec01dad5c98ac',
      iosApiKey: 'ios_sdk-3fa3fe8efa07b375f1148c51a437b2388d699898',
    );
  }

  Future<void> initIntercom() async {
    await NiceIntercom.instance.initialize(
      'bx1ckwyf',
      androidApiKey: 'android_sdk-b9a36f4f91a88d0157d90bae856ec01dad5c98ac',
      iosApiKey: 'ios_sdk-3fa3fe8efa07b375f1148c51a437b2388d699898',
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () async {
                  await NiceIntercom.instance.displayMessenger();
                },
                child: Text("Open message"),
              ),
              ElevatedButton(
                onPressed: () async {
                  await NiceIntercom.instance.loginIdentifiedUser(
                      userId:
                          '0a1409d47d77a59828e157dfc632531bf9f6332b9f2ad50dae2859207b8c7d22',
                      statusCallback: IntercomStatusCallback(
                        onFailure: (error) {
                          print('onFailure: $error');
                        },
                        onSuccess: () {
                          print('onSuccess');
                        },
                      ));
                },
                child: Text("Login Intercom"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
