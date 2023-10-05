import Flutter
import UIKit

class NiceIntercomPlugin: NSObject, FlutterPlugin, MethodCallHandler {
    private var intercom: Intercom?

    func handle(call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "initialize":
            guard let args = call.arguments as? [String: Any] else {
                result(FlutterError(code: "invalidArguments", message: "Invalid arguments", details: nil))
                return
            }

            let appId = args["appId"] as! String
            let apiKey = args["apiKey"] as! String

            intercom = Intercom(appId: appId, apiKey: apiKey)
            intercom?.start()

            result(nil)
        case "register":
            guard let args = call.arguments as? [String: Any] else {
                result(FlutterError(code: "invalidArguments", message: "Invalid arguments", details: nil))
                return
            }

            let userId = args["userId"] as! String
            let email = args["email"] as? String

            let registration = Registration(userId: userId, email: email)
            intercom?.register(registration: registration)

            result(nil)
        default:
            result(FlutterMethodNotImplemented)
        }
    }

    func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "com.thengoding.nice_intercom", binaryMessenger: registrar.messenger())
        channel.setMethodCallHandler(self)
    }
}
