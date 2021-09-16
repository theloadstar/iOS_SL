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

# Rounded Corner Text Field

> The default text field doesn't come with rounded corners and text indentation. It's our responsibility to build a custom text field with these features. To do that, we will create a custom version of `UITextField`.

Create a new file of `view` folder, name it `RoundedTextField`, subclass of `UITextField`.

```sw
let padding  = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 5.0
        self.layer.masksToBounds = true
    }
```

1. UIEdgeInsets:

   ![UIEdgeInsets](graph/UIEdgeInsets.png)

2. textRect:Returns the drawing rectangle for the text field’s text.

   So does `placeholderRect` and `editingRect`

3. layoutSubviews:This one  is called every time when the text field is laid out.

4. [.masksToBounds](https://blog.csdn.net/hhcncx/article/details/51278026)

Remember to set the class of text to `RoundedTextField`, except for the description one.

![roundedtext](graph/roundedtext.jpg)

# Move to the next text field

When we type sth in the text and hit the `return` key, the cursor doesn't go to the next field.

Okey, time to create a new controller for the new restaurant review.Set it to the subview of `UITableViewController`, and create an Outlet for each of the textview and textfield.

Adopt the protocol : `UITextFieldDelegate`.

> UITextFieldDelegate is the protocol we need to adopt in order to process the event. The protocol provides developers a set of optional methods to manage the editing of a text field. 

```sw
@IBOutlet var nameTextField: RoundedTextField!{
        didSet{
            nameTextField.tag = 1
            nameTextField.becomeFirstResponder()
            nameTextField.delegate = self
        }
    }
    @IBOutlet var typeTextField: RoundedTextField!{
        didSet{
            typeTextField.tag = 2
            typeTextField.delegate = self
        }
    }
    @IBOutlet var addressTextField: RoundedTextField!{
        didSet{
            addressTextField.tag = 3
            addressTextField.delegate = self
        }
    }
    @IBOutlet var phoneTextField: RoundedTextField!{
        didSet{
            phoneTextField.tag = 4
            phoneTextField.delegate = self
        }
    }
    @IBOutlet var descriptionTextView: UITextView!{
        didSet{
            descriptionTextView.tag = 5
            descriptionTextView.layer.cornerRadius = 0.5
            descriptionTextView.layer.masksToBounds = true
        }
    }
```

<span jump id = "question1">Question</span>: why description doesn't add delegate?

Ok, let's use the `.tag` to move the cursor.When user tapping `return` button, the func `textFieldShouldReturn` will be invoked.So, let's code this method.

```sw
func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextTextField = view.viewWithTag(textField.tag + 1){
            textField.resignFirstResponder()
            nextTextField.becomeFirstResponder()
        }
        
        return true
    }
```

1. `viewWithTag(_:)`:Returns the view whose tag matches the specified value.
2. `resignFirstResponder()`:Notifies this object that it has been asked to relinquish(放弃) its status as first responder in its window.

Finally, make connections with text view/fields!

![movetothenext](graph/movetothenext.gif)





# To Do

- [ ] [Question1](#question1)



















