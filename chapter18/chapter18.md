This chapter, we will build a new screen for adding a new restaurant.

# Design

Drag a *Table View Controller* and set its *Content* to `Static Cells`, *Table View Section* *Rows* to `6`.

For the first cell, set the height to `200` and change the background color to `light gray`.<font color = "red">Set the *Selection option to `None`</font>. Drag a imageview upon it, and set the image to `photo`(system).Change the tint color to `black`.24x18, lock in the center.

---

For the second cell, height:88, *Selection*: `None`. Drag a label, title:name, font: Headline, color: dark gray. Then, drag a text field under the name label.

> The text field is a control for capturing the user input and displaying the editable text. Typically you use it to gather small amounts of text from users.

Set the *placeholder value* :` Fill in the restaurant name`.*border style*:`None`.*Font type*:`Body`. *Background color*: `light gray` . Embed these two, add four constraints:5/2/2/1. Select the stack view and change the *Alignment* to `Fill`. Change the spacing to `5`.

---

Third-fifth cell are the same as second cell, just make the title different.

---

For the last one, height:125. Drag a label and name it `DESCRIPTION`.This time drag a *Text View* to let users input multiple lines.Background:light gray. Font:body.Embed these two, the stack view is same as above.

---

Finally, embed this table view to navigation bar.(Why?Oh, I know: To let the top of the screen show title)Select the tableview, go to the menu->editor->Embed IN->NavigationBar.Set the title name `New Restaurant`

# Link Up

We need to show this controller when user tapping `+` button. <font color = "red">Drag a **Bar Button** to the navigation bar of the Food Pin controller.</font>Set the title blank, and the image `plus`. Tint: black.

![barbutton](graph/barbutton.png)

> A bar button (UIBarButtonItem) is very similar to a standard button (UIButton). However, a bar button is specifically designed for navigation bars and toolbars.
>

Hold `control` and drag from the button to the `newrestaurant`'s navigation bar.Select `present modally` and the segue's identifier `addRestaurant`.

We also need to add a exit for users in newrestaurantviewcontroller.Add a new bar button   to the navigation bar top-left, set the image `Xmark`, title blank, tint black.Add code to `RestaurantTableViewController`, and make connection.

```sw
@IBAction func unwindtohome(segue: UIStoryboardSegue){
        dismiss(animated: true, completion: nil)
    }
```

Have a test:

![unwindtohome](graph/unwindtohome.gif)

