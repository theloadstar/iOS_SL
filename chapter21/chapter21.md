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



























