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
        // Create UDP NWListener with parameter .udp

        // Define the NWListener's service with the initialised name and the networkType constant

        // When a new connection arrives, start it. Then call rece self.receive(on:)

        // Start listener
    }

    func receive(on connection: NWConnection) {
        // Call receive on the connection and trigger the receivedTextHandler for text

        // If there are no errors, call this function recursively:
        // self.receive(on: connection)
    }
}
