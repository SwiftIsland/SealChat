//
//  SealChatMessage.swift
//  SealChat
//
//  Created by Roy Marmelstein on 2018-07-03.
//  Copyright © 2018 Roy Marmelstein. All rights reserved.
//

import Foundation
import MessageKit

// The basic message unit for display with MessageKit
struct SealChatMessage: MessageType {
    var sender: Sender
    var messageId: String
    var sentDate: Date
    var kind: MessageKind
}
