import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        // rootViewControllerから表示の元となるFlutterViewControllerを取り出す
        let controller = window.rootViewController as! FlutterViewController
        // メソッドチャネルに任意の名前を付け、controllerのbinaryMessengerを使って初期化
        let methodChannel = FlutterMethodChannel(name: "for_ios_method_channel/for_study", binaryMessenger: controller.binaryMessenger)

        // flutter側でgoodbyeWorldが呼ばれたらcallGoodbyeWorldを呼び出す
        methodChannel.setMethodCallHandler { [weak self] methodCall, result in
            guard methodCall.method == "goodbyeWorld", let strongSelf = self else {
                return result(FlutterMethodNotImplemented)
            }
            return result(strongSelf.callGoodbyeWorld())
        }

        // 以下は既存コード
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    private func callGoodbyeWorld() -> String {
        return "Goodbye World!"
    }
}
