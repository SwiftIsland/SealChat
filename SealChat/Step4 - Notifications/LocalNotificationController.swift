//
//  LocalNotificationController.swift
//  SealChat
//
//  Created by Roy Marmelstein on 2018-07-03.
//  Copyright © 2018 Roy Marmelstein. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications

class LocalNotificationController: NSObject, UNUserNotificationCenterDelegate {

    override init() {
        super.init()
        UNUserNotificationCenter.current().delegate = self
        self.requestAuth()
    }

    func requestAuth(){
        // Request auth for recceiving notifications
    }

    func notify(message: String, sender: String) {
        // Create and schedule a local message

        // Add the sender name as a local identifier

        // Create a UI Notification extention

        // Add the categoryIdentifier "CustomSealNotif" to the notfication's content

        // Configure UNNotificationExtensionCategory in your extension's Info.plist to include "CustomSealNotif"

        // In your extension's Info.plist, set UNNotificationExtensionDefaultContentHidden to true to remove chrome.
    }

    // This shows local notifications in foreground
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .badge, .sound])

    }
}
