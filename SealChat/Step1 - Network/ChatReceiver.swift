//
//  ChatReceiver.swift
//  SealChat
//
//  Created by Roy Marmelstein on 2018-07-01.
//  Copyright © 2018 Roy Marmelstein. All rights reserved.
//

import Foundation
import Network

class ChatReceiver {
    var receivedTextHandler: ReceivedTextHandler?

    init(name: String) {
        // Create UDP NWlistener

        // Define Service with name and type

        // When a new connection arrives, start it. Then call rece self.receive(on:)

        // Optional: error handling on state update handler

        // Start listener
    }

    func receive(on connection: NWConnection) {
        // Call receive on the connection, send a handshake back to the recipient and trigger the receivedTextHandler for text

        // If there are no errors, call this function recursively:
        // self.receive(on: connection)
    }
}
