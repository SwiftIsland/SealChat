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
        // Create content for local notification with UNMutableNotificationContent

        // Add the sender name as a thread identifier, this is iOS12's way of handling threading

        // Create a trigger for local notification with UNTimeIntervalNotificationTrigger

        // Create request to UNNotificationRequest

        // Add the request to UNUserNotificationCenter.current

        // Create and schedule a local message

        // For a custom Extension:

        // Add the categoryIdentifier "CustomSealNotif" to the notfication's content
        // Configure UNNotificationExtensionCategory in your extension's Info.plist to include "CustomSealNotif"
        // In your extension's Info.plist, set UNNotificationExtensionDefaultContentHidden to true to remove chrome.
    }

    // This shows local notifications in foreground
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .badge, .sound])
    }
}
