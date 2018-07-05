//
//  DeviceBrowserViewController.swift
//  SealChat
//
//  Created by Roy Marmelstein on 2018-07-02.
//  Copyright © 2018 Roy Marmelstein. All rights reserved.
//

import UIKit

// The DeviceBrowserViewController view begins advertising the Chat Listener so other devices can see the user and presents to the user a list of available BonourDevices to connect to (using NetServiceBrowser and implements NetServiceBrowserDelegate).

// Quality Bonus: names are essentially unique identifiers, make sure there is no duplication on the list.
class DeviceBrowserViewController: UITableViewController, NetServiceBrowserDelegate {

    var chatController: ChatController?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Select Device"
        chatController = ChatController()
        chatController?.startReceiver()
        // search for services of networkType and networkDomain with NetServiceBrowser
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DeviceCell", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        // Show device names
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // When selecting a device, we push the chat view controller configured with the device name and chat controller
        let deviceName = String()
        let chatViewController = ChatViewController()
        if let chatController = chatController  {
            chatViewController.setUp(for: deviceName, chatController: chatController)
        }
        self.navigationController?.pushViewController(chatViewController, animated: true)
    }

    func netServiceBrowser(_ browser: NetServiceBrowser, didFind service: NetService, moreComing: Bool) {
        guard service.name != UIDevice.current.name else { return }
        // Add device name
    }

}
