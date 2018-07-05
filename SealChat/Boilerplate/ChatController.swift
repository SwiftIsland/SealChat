//
//  ChatController.swift
//  SealChat
//
//  Created by Roy Marmelstein on 2018-07-01.
//  Copyright © 2018 Roy Marmelstein. All rights reserved.
//

import Foundation
import UIKit

typealias ReceivedTextHandler = ((String) ->())

// The chat controller manages the state of both chat sender and chat receiver.
class ChatController
{
    var targetName: String?
    var chatSender: ChatSender?
    var chatReceiver: ChatReceiver?

    func startReceiver() {
        // The current user name is UIDevice.current.name
        self.chatReceiver = ChatReceiver(name: UIDevice.current.name)
    }

    func applyReceiver(receivedTextHandler: @escaping ReceivedTextHandler){
        self.chatReceiver?.receivedTextHandler = receivedTextHandler
    }

    func startSender(targetName: String) {
        self.chatSender = ChatSender(name: targetName)
    }

    func send(text: String) {
        self.chatSender?.send(message: text)
    }

}
