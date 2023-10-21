//
//  LoginTextFieldPlugin.swift
//  Runner
//
//  Created by 今村京平 on 2023/10/20.
//

import Flutter

class LoginTextFieldPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let factory = LoginTextFieldPlatformViewFactory(messenger: registrar.messenger())
        registrar.register(factory, withId: "login_text_field")
    }
}
