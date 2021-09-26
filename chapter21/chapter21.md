When first lanching some apps, there are some tutorials in the launching view calles *WalkThrough*.Whether is it good or bad is not within this chapter's discussion.Let's just learn how to do this.

# Page View Controller

Let's start with creating a new storyboard. Right-click the **StoryBoard** folder and create a storyboard, name it with `OnBoarding`. Then, drag a `Page View Controller` .

> Presents a sequence of view controllers as pages, via coordination with a data source and delegate. Swipe navigation between the pages is automatically handled with a page curl transition that tracks the user's finger. The navigation orientation can be horizontal, like pages in a book, or vertical, like pages in a wall calendar.
>
> From Apple.

Change the *Transition Style* from *Page Curl* (for book-like style) to *Scroll*.Assign a *Storyboard ID* to it:`WalkthroughController`.

There are two kinds of view controllers in the walkthrough we are going to achieve. One is *page content view controller*, which is a plain *view controller*, storing the objects within. The other is *page view controller* using `UIPageViewController`, responsible for managing *page content view controller*, such as control how one view switches to another.

![relation](graph/relation.png)

The graph's four area are actually all *page content view controller*, and *page view controller* is responsible for managing them.Besides, we need a master controller(simply a view controller) to hold both of them.

# Get Started

Drag a *View Controller* for *Master View Controller* and drag a *Container view* upon it to contain *page view controller*. Set its width/height to 414/500. Then, `control` + `drag` to make a connection between the container and page view controller. Set *container view* 's top/left/right constraints to 0.

Then, drag a *view object*, set X/Y:0/500, width/height:414/396.Set four constraints to 0.

After this, there are still some layout errors. Here, the tutorial wants to let *container view* take up two-thirds part of view controller while the empty view one-third.

To achieve this, `contro` + `drag` from `view` to `safe area` and select `equal height`.Then, select the constraint we just defined, change its `Multiplier` to `1:3`.

Next, go to the buttons and page indicator. Drag a button: w/h:140/50. Title:Next. Font:Subhead. Color:white/red, lock this one's height and width. Another button: Skip/Body/Dark Gray. Drag a *page control object*, set its color to light gray and current page to red.Embed these three and set spacing to `20` , make the stack view centre both direction.

# Design Page Content View

Add the materials to `Assets`, check `preserve vector data` .Remember this is *Page Content View* instead of *Page View*. Set the simulator's height to `624` to let it look like the same as *container view*.Drag an Image View, 333x229.Drag a label, set to `Rubik bold`, centre **Alignment**, name it `heading`, dark gray.Drag another one, name it `Subheading`, rubik, regular, 16, cetre **Alignment**, light gray.

Embed two labels and set spacing to 10, Alignment Centre. Embed this one with Image View, Alignment Centre and spacing 50.For this stack view: top/left/button/right:50/24/10/24.Lock the Aspect Ratio of imageview, and the bottom one `Greater than or equal`.

# Create content class

After designing the UI, we need to create the class to pair with the view controllers.Let's start with the *Page Content View Controller*, refered as *WalkthroughContentViewController*. Create a new controller file as subclass of *UIViewController*, name it *WalkthroughContentViewController*.

```sw
		override func viewDidLoad() {
        super.viewDidLoad()
        headingLabel.text = heading
        subheadingLabel.text = subHeading
        contentImageView.image = UIImage(named: imageFile)
        // Do any additional setup after loading the view.
    }
		@IBOutlet var headingLabel : UILabel!{
        didSet{
            headingLabel.numberOfLines = 0
        }
    }
    @IBOutlet var subheadingLabel : UILabel!{
        didSet{
            subheadingLabel.numberOfLines = 0
        }
    }
    @IBOutlet var contentImageView: UIImageView!
    
    var index = 0
    var heading = ""
    var subHeading = ""
    var imageFile = ""
```

> The index variable is used to store the current page index. For instance, the first walkthrough screen will have the index value of 0. The view controller is designed to display an image, heading, and subheading. So we create three variables for data passing.

Then, let's make connections.First, set the onboarding storyboard as *WalkthroughContentViewController*, and set its storyboard ID as the same.Next, `control` and `drag`.

























