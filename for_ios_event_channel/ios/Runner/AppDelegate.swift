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
        // イベントチャネルに任意の名前を付け、controllerのbinaryMessengerを使って初期化
        let eventChannel = FlutterEventChannel(name: "for_ios_event_channel/for_study", binaryMessenger: controller.binaryMessenger)

        // flutter側でcountTenが呼ばれたらcountTenを呼び出す
        let countTenStreamHandler = CountTenStreamHandler()
        eventChannel.setStreamHandler(countTenStreamHandler)

        // 以下は既存コード
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}

class CountTenStreamHandler: NSObject, FlutterStreamHandler {
    // 非同期にイベントを発行するコールバック。
    // FlutterErrorでコールバックを呼び出すと、エラーイベントが発生します。
    // FlutterEndOfEventStreamを指定してコールバックを呼び出すと、これ以上イベントが発行されないことを示します。
    // nilを含むその他の値は成功イベントとして放出されます。
    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        var count = 0
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
            count += 1
            events(String(count))
            if count >= 10 {
                timer.invalidate()
                events(FlutterEndOfEventStream)
            }
        })
        return nil
    }

    // Flutter側でこのチャンネルに関連付けられたStreamから最後のリスナーが登録解除されたときに呼び出される。
    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        return nil
    }
}
