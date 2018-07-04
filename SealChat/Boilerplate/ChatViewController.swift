//
//  ChatViewController.swift
//  SealChat
//
//  Created by Roy Marmelstein on 2018-07-02.
//  Copyright © 2018 Roy Marmelstein. All rights reserved.
//

import UIKit
import MessageKit

// This view is mostly about boilerplate to present an iMessage Style view with SealChatMessages
class ChatViewController: MessagesViewController, MessagesDataSource {

    var messageList: [SealChatMessage] = []

    var chatController: ChatController?
    var localNotificationController: LocalNotificationController?

    var targetName: String?
    lazy var otherSender: Sender? = {
        guard let targetName = targetName else { return nil }
        return Sender(id: targetName, displayName: targetName)
    }()

    // In the set up cool, we apply a recieve to the chatController and start the sender (i.e. connect to the other user's listenr server
    func setUp(for targetName: String, chatController: ChatController) {
        self.chatController = chatController
        self.targetName = targetName
        let sender = otherSender!
        self.chatController?.applyReceiver(receivedTextHandler: { (message) in
            DispatchQueue.main.async {
                let newMessage = SealChatMessage(sender: sender, messageId: UUID().uuidString, sentDate: Date(), kind:MessageKind.text(message))
                self.messageList.append(newMessage)
                self.messagesCollectionView.insertItems(at: [IndexPath(item: self.messageList.count - 1, section: 0)])
                self.messagesCollectionView.scrollToBottom()
                // This is part of Step 2:
                self.sealReact(to: message)
                self.localNotificationController?.notify(message: message, sender: targetName)
            }
        })
        self.chatController?.startSender(targetName: targetName)
    }

    func sealReact(to message: String) {
        // Get seal image for message.

//        let imageView = UIImageView(frame: self.view.bounds)
//        imageView.image = sealImage
//        imageView.contentMode = .scaleAspectFit
//        self.view.addSubview(imageView)
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
//            imageView.removeFromSuperview()
//        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Init LocalNotificationController
        self.localNotificationController = LocalNotificationController()

        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        self.messageInputBar.delegate = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // We repeat the set up on view did appear, because there's a good chance the connection was disconnected
        if let targetName = targetName, let chatController = chatController {
            self.setUp(for: targetName, chatController: chatController)
        }
    }

    func currentSender() -> Sender {
        return Sender(id: UIDevice.current.name, displayName: UIDevice.current.name)
    }

    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messageList[indexPath.row]
    }

    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return 1
    }

    func numberOfItems(inSection section: Int, in messagesCollectionView: MessagesCollectionView) -> Int {
        return messageList.count
    }

}

// MARK: - MessagesDisplayDelegate

extension ChatViewController: MessagesDisplayDelegate {

    // MARK: - Text Messages

    func configureAvatarView(_ avatarView: AvatarView, for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) {
        avatarView.isHidden = true
    }

    func textColor(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> UIColor {
        return isFromCurrentSender(message: message) ? .white : .darkText
    }


    func enabledDetectors(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> [DetectorType] {
        return [.url, .address, .phoneNumber, .date, .transitInformation]
    }

    // MARK: - All Messages

    func backgroundColor(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> UIColor {
        return isFromCurrentSender(message: message) ? UIColor(red: 69/255, green: 193/255, blue: 89/255, alpha: 1) : UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
    }
}

// MARK: - MessagesLayoutDelegate

extension ChatViewController: MessagesLayoutDelegate {

    func cellTopLabelHeight(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        if indexPath.section % 3 == 0 {
            return 10
        }
        return 0
    }

    func messageTopLabelHeight(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        return 8
    }

    func messageBottomLabelHeight(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        return 8
    }

}


// MARK: - MessageInputBarDelegate

extension ChatViewController: MessageInputBarDelegate {

    func messageInputBar(_ inputBar: MessageInputBar, didPressSendButtonWith text: String) {

        // Each NSTextAttachment that contains an image will count as one empty character in the text: String

        for component in inputBar.inputTextView.components {

            if let text = component as? String {
                // We send the tecxty
                self.chatController?.send(text: text)
                let message = SealChatMessage(sender: currentSender(), messageId: UUID().uuidString, sentDate: Date(), kind:MessageKind.text(text))
                messageList.append(message)
                messagesCollectionView.insertItems(at: [IndexPath(item: messageList.count - 1, section: 0)])
            }

        }

        inputBar.inputTextView.text = String()
        messagesCollectionView.scrollToBottom()
    }

}

