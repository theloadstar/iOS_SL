This chapter, we will add some fantastic animations to *Food Pin*.

# Rate button

After import the images downloaded (I love these images), drag a *View* under the mapcell, set the height to 90.Then goes to the button. Headline,white/red,345/47,lock height, left/right/buttom:15/15/21.Next, let this button has rounded corners.We've done similar thing in `thumbnailImageView`, this time let's do it in the storyboard.

Select the button and in the `Identity inspector` click `+` button under the `User Defined Runtime Attributes`, add a new key `layer.cornerRadius`, set the type `number` and value `25`.

![ratebutton](graph/ratebutton.png)

# Restaurant Review Controller

Drag a new view controller and add a new image view. Set four 0 constraints to the image view.Then, drag a button to the top-right corner. This one is used for closing. Set the title blank and image to `xmark`, which is a SF-symbol. Set the `Point Size` to 30 to make this button larger, and set the color to white.Top/right:0/20

![xmark](graph/xmark.png)

For the rating buttons, this time they have both text and images. Rubik, 50. After C/V, embed them into a stack view. **Leading**, spacing:10. And make the stackview center of the screen.

Next, create a custom class.Define a IBoutlet and make connection.

# Create a Segue

`control` + `drag` from `rate it` button to the review controller, select `prsentmodally`

![prsentmodally](graph/prsentmodally.png)

Remember to set the `Identifier` of this segue to `showReview`, and add

```sw
else if segue.identifier == "showReview"{
            let destinationController = segue.destination as! ReviewViewController
            destinationController.restaurant = self.restaurant
        }
```

to the `prepare` func.

BTW, set the background image `content mode` to `Aspect Fill`.

From iOS 13, the `Present Modally` displays a scene like a card, to make it full screen, selet the segue and set `Presentation` to `Full Screen`.![fullscreen](graph/fullscreen.png)

![presentmodally](graph/presentmodally.jpg)

Try some other Transtions 🌚, `Partial Curl` is prefered~![transtion](graph/transtion.png)







