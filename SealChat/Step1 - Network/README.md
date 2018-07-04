# Step 1 - Network.framework

## About
Network.framework might seem new but you've been using it for a long time without even knowning. It's what powers NSURLSession. 

With iOS12, Apple is finally opening this Framework up for developers. It's a very smart, has a really nice Swift interface (interestingly, no Objective C interface) and is easy to use.

It's meant to modernise Networking code and reduce the need to use foundational methods and classes like getaddrinfo, SCNetworkReachability directly.  

What do you use Network.framework for? Sockets mainly. This is especially useful for games, live video streaming applications and messaging apps. 

For more details:
[https://developer.apple.com/videos/play/wwdc2018/715/](https://developer.apple.com/videos/play/wwdc2018/715/) 

## Key concept 

You send NWConnections, they are received by a host/NWListener. 

Connections have an interesting lifecycle:
<img width="1098" alt="screen shot 2018-07-04 at 14 09 55" src="https://user-images.githubusercontent.com/889949/42278819-3a31869e-7f9c-11e8-9352-fa58ecf41c9a.png">

After the Preparing phase, if a valid connection is not avaialble, the Connection will move to a Waiting phase. It will keep switching between Waiting and Preparing whenever the network changes. 

## Ways it can break 

Network issues. Doesn't work in background or when your personal hotspot is turned on.

## What will we do? 

Build a device browser that shows available devices on the network.
 
Set our app up to receive incoming messages and to send messages.

## Roles and Responsibilities

ChatController - is the interface for our Network. No work is needed on it in this step.

ChatSender -  responsible for connection to a host/NWListener, performing a handshake and sending messages to it.

ChatReceiver - responsible for acting as a NWListener, reacting to incoming connections, performing handshakes and calling the received message handler. 

DeviceBrowserViewController - responsible for showing a list of available devices on the network (using NetServiceBrowser).

