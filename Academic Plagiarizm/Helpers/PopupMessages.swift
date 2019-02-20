//
//  PopupMessages.swift
//  Academic Plagiarizm
//
//  Created by AHG on 2/19/19.
//  Copyright © 2019 Microcis. All rights reserved.
//

import Foundation
import SwiftMessages

struct PopupMessages {
    static func showErrorMessage(title: String = "", message: String, buttonText: String) {
        let error = MessageView.viewFromNib(layout: .tabView)
        error.configureTheme(.error)
        error.configureContent(title: title, body: message)
        error.button?.setTitle(buttonText, for: .normal)
        error.button?.isHidden = true;
        var errorConfig = SwiftMessages.defaultConfig;
        errorConfig.duration = .seconds(seconds: 3.5);
        errorConfig.presentationContext = .window(windowLevel: UIWindow.Level.statusBar)
        SwiftMessages.show(config: errorConfig, view: error);
    }

    static func getThinyForeverErrorMessage(message: String) -> (config: SwiftMessages.Config, view: MessageView) {
        let status = MessageView.viewFromNib(layout: .statusLine)
        status.backgroundView.backgroundColor = UIColor.purple;
        status.bodyLabel?.textColor = UIColor.white;
        status.configureContent(body: message);
        status.configureTheme(.error);
        //        status.configureFont();
        var statusConfig = SwiftMessages.defaultConfig
        statusConfig.duration = .forever;
        statusConfig.interactiveHide = false;
        statusConfig.ignoreDuplicates = true;
        statusConfig.presentationContext = .window(windowLevel: UIWindow.Level.statusBar)

        status.bodyLabel?.textAlignment = .center
        status.titleLabel?.textAlignment = .center;
        status.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17);
        status.bodyLabel?.font = UIFont.systemFont(ofSize: 16);

        return (config: statusConfig, view: status);
    }

    static func showWarningMessage(title: String = "", message: String) {
        let warning = MessageView.viewFromNib(layout: .cardView)
        warning.configureTheme(.warning)
        warning.configureDropShadow()
        warning.configureContent(title: title, body: message)
        warning.button?.isHidden = true;
        var warningConfig = SwiftMessages.defaultConfig
        warningConfig.duration = .seconds(seconds: 4.5);
        warningConfig.presentationContext = .window(windowLevel: UIWindow.Level.statusBar)
        SwiftMessages.show(config: warningConfig, view: warning);
    }

    static func showSuccessMessage(title: String = "", message: String) {
        let success = MessageView.viewFromNib(layout: .cardView)
        success.configureTheme(.success)
        success.configureDropShadow()
        success.configureContent(title: title, body: message)
        success.button?.isHidden = true
        var successConfig = SwiftMessages.defaultConfig
        successConfig.duration = .seconds(seconds: 3.0);
        successConfig.presentationStyle = .bottom
        successConfig.presentationContext = .window(windowLevel: UIWindow.Level.normal)
        SwiftMessages.show(config: successConfig, view: success);
    }

    static func showThinySuccessMessage(message: String){
        let status = MessageView.viewFromNib(layout: .statusLine);
        status.configureContent(body: message)
        status.configureTheme(.success);
        var statusConfig = SwiftMessages.defaultConfig
        statusConfig.duration = .seconds(seconds: 3);
        statusConfig.presentationContext = .window(windowLevel: UIWindow.Level.statusBar)
        SwiftMessages.show(config: statusConfig, view: status);
    }

    static func showInfoMessage(title: String = "", message: String) {
        let info = MessageView.viewFromNib(layout: .messageView)
        info.configureTheme(.info)
        info.button?.isHidden = true
        info.configureContent(title: title, body: message);
        var infoConfig = SwiftMessages.defaultConfig
        infoConfig.presentationStyle = .bottom
        infoConfig.duration = .seconds(seconds: 4.5)
        SwiftMessages.show(config: infoConfig, view: info);
    }

    static func showThinyInfoMessage(message: String){
        let status = MessageView.viewFromNib(layout: .statusLine)
        status.backgroundView.backgroundColor = UIColor.purple
        status.bodyLabel?.textColor = UIColor.white
        status.configureContent(body: message)
        status.configureTheme(.info);
        var statusConfig = SwiftMessages.defaultConfig
        statusConfig.presentationContext = .window(windowLevel: UIWindow.Level.statusBar)
        SwiftMessages.show(config: statusConfig, view: status);
    }

    static func showDoneMessage(message: String) {
        let status = MessageView.viewFromNib(layout: .statusLine)
        status.backgroundView.backgroundColor = UIColor.purple;
        status.bodyLabel?.textColor = UIColor.white;
        status.configureContent(body: message);
        status.configureTheme(.success);
        var statusConfig = SwiftMessages.defaultConfig;
        statusConfig.duration = .seconds(seconds: 3);
        statusConfig.presentationContext = .window(windowLevel: UIWindow.Level.statusBar)
        SwiftMessages.show(config: statusConfig, view: status);
    }

    static func showThinyErrorMessage(message: String) {
        let status = MessageView.viewFromNib(layout: .statusLine)
        status.backgroundView.backgroundColor = UIColor.purple;
        status.bodyLabel?.textColor = UIColor.white;
        status.configureContent(body: message);
        status.configureTheme(.error);
        var statusConfig = SwiftMessages.defaultConfig
        statusConfig.duration = .seconds(seconds: 3);
        statusConfig.presentationContext = .window(windowLevel: UIWindow.Level.statusBar)
        SwiftMessages.show(config: statusConfig, view: status);
    }

    static func getTinyInfoMessage(message: String) -> (config: SwiftMessages.Config, view: MessageView){
        let status = MessageView.viewFromNib(layout: .statusLine);
        status.configureContent(body: message)
        var statusConfig = SwiftMessages.defaultConfig
        status.configureTheme(.warning);
        status.bodyLabel?.textAlignment = .center;
        statusConfig.duration = .forever
        statusConfig.ignoreDuplicates = true;
        //        statusConfig.presentationContext = .window(windowLevel: UIWindowLevelStatusBar)
        statusConfig.dimMode = .gray(interactive: true);
        return (config: statusConfig, view: status);
    }

    static func showThinyWarningMessage(message: String) {
        let status = MessageView.viewFromNib(layout: .statusLine)
        status.backgroundView.backgroundColor = UIColor.purple
        status.bodyLabel?.textColor = UIColor.white
        status.configureContent(body: message)
        status.configureTheme(.warning);
        var statusConfig = SwiftMessages.defaultConfig
        statusConfig.duration = .seconds(seconds: 3);
        statusConfig.presentationContext = .window(windowLevel: UIWindow.Level.statusBar)
        SwiftMessages.show(config: statusConfig, view: status);
    }

    static func showThinyErrorMessageHighlight(message: String) {
        let status2 = MessageView.viewFromNib(layout: .statusLine)
        status2.backgroundView.backgroundColor = UIColor.orange
        status2.bodyLabel?.textColor = UIColor.white
        status2.configureContent(body: message);
        var status2Config = SwiftMessages.defaultConfig
        status2Config.presentationContext = .window(windowLevel: UIWindow.Level.normal)
        status2Config.preferredStatusBarStyle = .lightContent
        SwiftMessages.show(config: status2Config, view: status2);
    }
}

