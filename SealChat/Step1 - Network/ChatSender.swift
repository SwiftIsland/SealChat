//
//  ChatSender.swift
//  SealChat
//
//  Created by Roy Marmelstein on 2018-07-01.
//  Copyright © 2018 Roy Marmelstein. All rights reserved.
//

import Foundation
import Network

class ChatSender {

    init(name: String) {
        // Create a UDP NWConnection

        // Define what happens when status is updated, when connection is ready, send handshake.

        // Start the connection
    }

    func performHandshake() {
        // Handshake
        self.send(message: networkHandshake)
        // Receive the handhsake back from the connection
    }

    func send(message: String) {
//        let data = message.data(using: .utf8)
        // Send the message as Data to the connection
    }

}
