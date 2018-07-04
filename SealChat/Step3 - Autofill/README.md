# Step 3 - Password autofill

## About

Since iOS10, it's possible t set a textContentType on any text field and AutoFill will make relevant suggestions.

iOS12 brings with it some big improvements to password autofill.

You can now tag a text field as:
- One time code: when you have 2 factor authentication and get a temporary code via SMS, this will automatically suggest that code to the user. No more switching between apps and memorising numbers.
- New password: this will suggest a valid password to the user based on pre-defined password rules.

For more details:
[https://developer.apple.com/videos/play/wwdc2018/204/](https://developer.apple.com/videos/play/wwdc2018/204/)

## Key concept

iOS can create secure passwords for you within any set of password constraints.

## Ways it can break

There are some visual issues with the current implementation

## What will we do?

SealChat has a broken log in page.

We will tag the text fields and experiment with creating some password rules.

Example rule:
"required: upper; required: lower; required: digit, [-().&@?'#,/&quot;+]; max-consecutive: 2; minlength: 8;"

Instructions on rules:
[https://developer.apple.com/documentation/security/password_autofill/customizing_password_autofill_rules](https://developer.apple.com/documentation/security/password_autofill/customizing_password_autofill_rules)

Apple even built a validation tool:
[https://developer.apple.com/password-rules/](https://developer.apple.com/password-rules/)
