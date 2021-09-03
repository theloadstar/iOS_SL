# Navigation, scence and segues

*  Scence: refers to the on-screen content. In oter words, the current view on the device is a scence
* Segue: Transition among scences
* Navigation: segues' class (IMU)

# Create Navigation Controller

Choose *Restaurant Table View Controller Scence*, the in the top menu, *Editor -> Embed In -> Navigation Controller*.

![createnavigation](graph/createnavigation.png)

Change the name of *Navigation Item* in *Restaurant Table View Controller* to `Food Pin`

![renamenaviitem](graph/renamenaviitem.png)

![renamenaviitemre](graph/renamenaviitemre.png)

We can set the title to *Large Title* :

```sw
navigationController?.navigationBar.prefersLargeTitles = true
```

![largetitle](graph/largetitle.gif)

# Create Detail View Controller

When we tap one of the restaurants, we want to see the detail info rather than alertactions. Thus, we need to create *Detail View Controller*

This chapter's theme is navigation, so let's keep the detail scence as simple as possible.

![detailviewcontroller](graph/detailviewcontroller.png)

Now, we got two view controller, what we need to do is to connect them.

> In music, a segue is a seamless transition between one piece of music and another. In storyboards, the transition between two scenes is called segue.

The connection is easy to establish. Select `datacell`, hold `control` and drag form it to the new control view. Then, a pop over view appears, select `show`.

![connections1](graph/connections1.png)

![connections2](graph/connections2.png)

* **Show** - when the show style is used, the content is pushed on top of the current view controller stack. A back button will be displayed in the navigation bar for navigating back to the original view controller. Typically, we use this segue type for navigation controllers.
* **Show detail** - similar to the show style, but the content in the detail (or destination) view controller replaces the top of the current view controller stack. For example, if you select show detail instead of show in the FoodPin app, there will be no navigation bar and back button in the detail view.
* **Present modally** - presents the content modally. When used, the detail view controller will be animated up from the bottom and cover the entire screen on iPhone. A good example of present modally segue is the "Add" feature of the built-in Calendar app. When you click the + button in the app, it brings up a "New Event" screen from the bottom.
* **Present as popover** - Present the content as a popover anchored to an existing view. Popover is commonly found in iPad apps, and you have already implemented popover in earlier chapters.

In my testing, I can't find the difference between 2 and 3 by now, and 4 built failed....

# Create RestaurantDetailViewController

After create this Class, we need to create `restaurantImageName` to pass the image name, and `restaurantImageView` to display the image, which is an outlet.Then, make a connection.Next, add `restaurantImageView.image = UIImage(named: restaurantImageName)` in `viewDidLoad()`

# Pass data Using Segues

> When a segue is triggered, before the visual transition occurs, the storyboard runtime notifies the source view controller (i.e. RestaurantTableViewController) by calling the `prepare(for:sender:)` method:
>
> ``` 
> func prepare(for segue: UIStoryboardSegue, sender: Any?) {
> 
> }
> ```
>
> By overriding the method, you can pass any relevant data to the new controller, which is `RestaurantDetailViewController` in our project.

It is very likely that we will have more than one segue between view controllers. Thus, the best way is to give each segue a unique identifier in storyboard.

Then, we got detail view like this:

![detailviewre](graph/detailviewre.gif)

Finally, we can disable the `Large Title` in detail view controller in `viewdidload` func in `RestaurantDetailView.swift`

```sw
navigationItem.largeTitleDisplayMode = .never
```

