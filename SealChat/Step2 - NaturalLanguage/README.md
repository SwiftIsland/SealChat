# Step 2 - NaturalLanguage.framework

## About

NaturalLanguage.framework is meant to replace NSLinguisticTagger.

While it currently offers similar functionality, Apple hinted that continued investment and innovation will happen on the framework and it's worth transitioning to using it.

It offers a range of tools for learning more about strings.

You can answer questions like:
- What are the place names in this string?
- What are the verbs in this string?
- What language is this text in?
- What is the fifth word from the end in this string?
- How would a machine learning model classify this string?

And many more.

For more details:
[https://developer.apple.com/videos/play/wwdc2018/713/](https://developer.apple.com/videos/play/wwdc2018/713/)

## Key concept

A string doesn't have to be a black box. We can derive meaning by analysing strings.

## Ways it can break

Some of the smarter functions only work in English.

## What will we do?

func sealImage(sentence: String) gets called whenever a new message arrives, if it returns an image, it will flash on the screen.

### Step 2.1
We will write a function that finds names inside a string.

We will define a mapping between a few names and seal images.

When the mapped names appear in an incoming message, we will show the seal images.

### Step 2.2

We will use a sentiment machine learning model to determine if a sentence is positive or negative.

We will show positive and negative seal images based on the model's output.

If you have Mojave installed, you can train your own CoreML Model with the sentiment dataset provided. Otherwise, you can use the pre-trained one in the project.
