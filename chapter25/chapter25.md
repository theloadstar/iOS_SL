As we can see, the app we created so far only support English.So, we need to support multiple languages. First we will internationalize our app, then localizate it.

# Internationalize the app

We use `NSLocalizedString` to internationalize the string, and it has two arguments:

* `key`: the string to be localized
* `comment`:the string that is used to provide additional information for translation.

Let's take the `AboutViewController` as an example:

```sw
var sectionTitles = [NSLocalizedString("FeedBack", comment: "FeedBack"), NSLocalizedString("Folllow us", comment: "Follow us")]
```

# Exercise 1

Okay, adjust all the user-facing text (mmp....)







# To do

- [ ] The delete/share action do not have title