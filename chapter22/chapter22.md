> While navigation controllers let users navigate hierarchical content by managing a stack of view controllers, tab bars manage multiple view controllers that don't necessarily have a relation to one another.

# Build a Tab Bar Controller

Go to the mainstoryboard, select `Navigation Controller` and in Xcode menu, Editor->Embed in-> Tab Bar Controller.Change the `System Item` to `Favourites`.Then, a tab bar is done, without any constraints needed.

# Hide when pushed

Take `RestaurantDetailViewController` as an example, there are two ways to hide the tab bar.

1. Select the detail view controller in storyboard, and check `Hide Bottom Bar on Push`.

   ![hidetabbar](graph/hidetabbar.png)

2. add `destinationController.hidesBottomBarWhenPushed = true` in `prepare` method of `RestaurantTableViewController`.

   ---

   <span jump id = "question1"><font color = "red">Question1</font></span>: If I simply add `hidesBottomBarWhenPushed = true` in detailview's `viewDidLoad` or `viewWillAppear`, it doesn't work. Why?

   ---















# To Do

- [ ] [Question1](#question1)