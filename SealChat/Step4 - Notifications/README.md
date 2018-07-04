# Step 4 - Notifications changes

## About

Notifications are a big area for improvement in iOS12.

The main new things:
- Grouping and threading.
- Custom UI for notifications through extensions (with interactivity).

For more details:
[https://developer.apple.com/videos/play/wwdc2018/710/](https://developer.apple.com/videos/play/wwdc2018/710/)

## Key concept

Notifications can be mini-apps and a lot less spammy.

## What will we do?

SealChat doesn't have a backend so we will set up local notifications.

notify(message: String, sender: String) gets automatically called when new messages arrive.

We will set a thread identifier to affect the grouping of messages.

We will create a custom UI for notifications.
