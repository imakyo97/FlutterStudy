//
//  LoginTextFieldView.swift
//  Runner
//
//  Created by 今村京平 on 2023/10/20.
//

import Flutter
import UIKit

final class LoginTextFieldPlatformViewFactory: NSObject, FlutterPlatformViewFactory {
    private let messenger: FlutterBinaryMessenger

    init(messenger: FlutterBinaryMessenger) {
        self.messenger = messenger
    }

    func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
        return LoginTextFieldPlatformView(frame: frame, viewIdentifier: viewId, arguments: args, binaryMessenger: messenger)
        // frame: 新しく作成されるUIViewの矩形をポイントで測定（printしてみたら(0.0, 0.0, 0.0, 0.0)だった）
        // viewId: この UIView の一意な識別子（printしてみたら0だった）
        // args: createArgsCodecが実装されていない場合、またはDartコードから作成引数が送られてこない場合、これはNULLになります。それ以外の場合は、createArgsCodecによってデコードされたDartコードから送られた値になります。（printしてみたらnullだった）
    }

    // Dartコードから引数を設定する場合に実装が必要
    // これを実装していない場合、Flutter側でargsを設定してもcreate(withFrame:, viewIdentifier, arguments)のargumentsはnullになる
    // ここでデコードされた値がcreate(withFrame:, viewIdentifier, arguments)のargumentsの値になる
    public func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
          return FlutterStandardMessageCodec.sharedInstance()
    }
}

class LoginTextFieldPlatformView: NSObject, FlutterPlatformView {
    private let loginTextFieldView: UIView

    init(
        frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?,
        binaryMessenger messenger: FlutterBinaryMessenger?
    ) {
        loginTextFieldView = LoginTextFieldView()
    }

    func view() -> UIView {
        return loginTextFieldView
    }
}

class LoginTextFieldView: UIView {

    init() {
        super.init(frame: .zero)

        if let view = Bundle(for: type(of: self)).loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?.first as? UIView {
            self.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                view.topAnchor.constraint(equalTo: self.topAnchor),
                view.leftAnchor.constraint(equalTo: self.leftAnchor),
                view.rightAnchor.constraint(equalTo: self.rightAnchor),
                view.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
