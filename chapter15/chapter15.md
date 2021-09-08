# Customize Navigation Bar

Let's go to the code directly.

```sw
navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
```

Set the background image a transparent one.

![transparentbar](graph/transparentbar.gif)

```sw
navigationController?.navigationBar.shadowImage = UIImage()
```

顾名思义即可，就是把阴影部分（横线）设置为一个空的图

```sw
if let customFont = UIFont(name: "Rubik-Medium", size: 40.0){
            navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor(red: 231/255, green: 76/255, blue: 60/255, alpha: 1.0), NSAttributedString.Key.font: customFont]
        }
```

![largetitleattri](graph/largetitleattri.png)

Result:

![result1](graph/result1.png)

For the `DetailViewController`:

```sw
				navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.tintColor = .white
        tableView.contentInsetAdjustmentBehavior = .never
```

First three lines are easy to understand.For the fourth line:

> “The value of the property controls the behavior for determining the adjusted content offsets of the table view. By default, it is set to .always. In this case, iOS automatically adjusts the content offset of the table view such that the content area will not be blocked by the navigation bar (see figure 15-3 (left)). Now as the navigation bar is set to transparent, we want to shift the table view upward. In order to do that, we set contentInsetAdjustmentBehavior to .never, telling iOS not to adjust the content area.”
>
> 摘录来自: Simon Ng. “Beginning iOS 13 Programming with Swift。” Apple Books. 

![contentInset](graph/contentInset.jpg)

# Back Button

Have you ever wondering what's the two files`AppDelegate.swift` and `SceneDelegate` in `Resource` folder for? As for `AppDelegate`, it's the entry of a application. So, to customize the back button globally, we can insert code in the method `didFinishLaunchingWithOptions`. We can infer the effect from the name.

> This method will be called when the application loads up and is suitable for adding customization code that affects the entire application

```sw
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let backButtonImage = UIImage(systemName: "arrow.left", withConfiguration: UIImage.SymbolConfiguration(weight: .bold))
        UINavigationBar.appearance().backIndicatorImage = backButtonImage
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = backButtonImage
        
        return true
    }
```

`weight: .bold` set the font of backimage. And line4&5 are used together to make the customizing effect. Finally, we need to remove the title text. Go to storyboard, set the value of `Back Button` field to space in *Food Pin* controller's Attributes inspector.(<font color = "red">It's a Space ` `, not `nil`!!!</font>

![removetitle](graph/removetitle.png)

result:

![customizebackbutton](graph/customizebackbutton.png)

# Hide the bar when swiping

This feature is my favourite!

We can select `Navigation Controller` in story board and check the `On swipe` to achieve.

![hidebar](graph/hidebar.png)

However, this will apply to all the navigation controllers in the app. In order to hide bar in certain controller, we need to code.Remember to uncheck `On Swipe` before go to coding.

```sw
navigationController?.hidesBarsOnSwipe = true
```

add this one in `TableViewController` 's `viewDidLoad`, and set `false` in another controller. However, there are two problems:

![twoproblems](graph/twoproblems.png)

This is because `viewDidLoad` only be called once when the view is loaded.



---

# Chapter12 To-Do

接着这次机会，使用print找出了调用的顺序，也解释了chapter12的To-Do:在`DetailViewController`的`viewDidLoad`方法里print `Detail`, 在TableViewController的`prepare`方法里最后一行print `Detail_Segue`， 最后得出前者的执行顺序更晚。