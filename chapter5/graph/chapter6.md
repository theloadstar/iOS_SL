> To the user, the interface is the product.
>
> ---Aza Raskin

As our App UI become more complex, using auto-layout only is far from enough.So here comes the **Stack View**

# Stack View

> The stack view provides a streamlined interface for laying out a collection of views in either a column or a row

By using stack view, we can embed multiple UI objects into one.In other word, a stack is a set of object, where we design constraints inside (in my understanding).Besides, we can embed a stack view in another stack view.Therefore, we only need to define constraints for the subview(i.e. stackview).

![stackviewexample](../../chapter6/graph/stackviewexample.png)

There are two ways to use stack view.

1. Drag a stack from Library and add views(e.g. Label, Button and so on) into it.<img src="../../chapter6/graph/usestackview1.png" alt="usestackview1" style="zoom:50%;" />

2. Choose two or more views and then click stack view like this:<img src="../../chapter6/graph/usestackview2.png" alt="usestackview2" style="zoom:50%;" />

# Add images to your App

The folder *Assets.xcassets* is for managing images and icons used for your app.![Assets.xcassets](../../chapter6/graph/Assets.xcassets.png)

Here are two concepts:

* raster image: understanded as no-vector image. Thus, we need to provide three different resolutions of images when using raster image, with suffix `@2x` `@3x`
* vector image:矢量图, knew before.

> Whenever possible, ask your designer to prepare the images in PDF format. 

When you need to add images to *Assert*, you can't just drag files to the files position in Finder, instead, you must drag files to Xcode `Set List` or `Set Viewer`, then Xcode will organize these sets automatically.

<img src="../../chapter6/graph/graphsets.png" alt="graphsets" style="zoom:40%;" /> <img src="../../../../Library/Application Support/typora-user-images/image-20210829103044565.png" alt="graphsets" style="zoom:50%;" />

After this ,we just need to use the set of name , omitting the file extension.

# Get Started

Once we drag a view to a stack view, the stack view will automaticall resize itself to fit the view.

![getstarted1](../../chapter6/graph/getstarted1.png)

Now, there are many views stacking in the smae place, we may have problem selecting certain view. We can hold `Shift` and `Double-Click` to choose which one we want.Also, we can just choose in the document outline.

![shiftanddoubleclick](../../chapter6/graph/shiftanddoubleclick.png)

---

* properties of stack view

  ![propertiesofstackview](../../chapter6/graph/propertiesofstackview.png)

The following are the content of tutorial:

* The axis option indicates whether the arranged views should be layout vertically or horizontally. By changing it from vertical to horizontal, you can turn the existing stack view to a horizontal stack view.

* The alignment option controls how the arranged views are aligned. For example, if it is set to Leading, the stack view aligns the leading edge (i.e. left) of its arranged views along its leading edge.

* The distribution option defines the size and position of the arranged views. By default, it is set to Fill. In this case, the stack view tries its best to fit all subview in its available space. If it is set to Fill Equally, the vertical stack view distributes both labels equally so that they are all the same size along the vertical axis.

Sample:

![stackpropertiessamples](../../chapter6/graph/stackpropertiessamples.png)

---

When I put three views to the storyboard, I find that the no-vector image(user2) is more clear, funny😂

<img src="../../chapter6/graph/threeviews.png" alt="threeviews" style="zoom:50%;" />

---

* Set the aspect ratio(宽高比):

`control-drag`  horizontally and then click `Aspect Ratio`(这操作属实把我惊呆了，不愧你是，)， then the aspect ratio is locked.Similarly, we can lock the width and height as well.

![Settheaspectratio](../../chapter6/graph/Settheaspectratio.png)

<font color = "red">Note</font>: After setting the aspect ratio, the width or height of the image may change, just leave it.

---

When we nest the Label stackview and image stackview into one stack view, make sure the `Alignment` is set to <font color = "red">Fill</font> , so that we the image stack view, which is set to `Fill` as well can automatically resize itself oon larger screen like iPad.

---

* add contraints to the stack view: top,leading and trailing.(50,10,10)
  1. use `control` + drag (myself)
  2. click `add new contraints`(tutorial, more simple)

---

By far, our layout works well in different meachines, except small screen like iPhone SE and 4s: the `Instant Developer` is truncated because of the width of screen.

And in landscape mode, the image is truncated as well

![truncated](../../chapter6/graph/truncated.png)

To fix the first problem, choose the label, and click` Autoshrink` -> `Minimun Font Size`, this tells Xcode to determine the suitable font size so that it can perfectly be displayed.

For the second one, let's see if the tutorial mentions it later.

---

* Add two buttons:

I find the width of two buttons resized after embeded in stack view. At first I add two width constraints of them, then the tutorial says that we can add just one constraint to the button stack view.

---

# Adapting Stack Views Using Size Classes

We now have new problems:

<img src="../../chapter6/graph/orientationproblem.png" alt="orientationproblem" style="zoom:50%;" />

1. the whole stack view is too far from the top.
2. the middle image overlapped with the bottons.

We need to fix these, <font color = "red">remember that all changes are only works for iPhone ,</font>since iPad looks good.

* New concept: **Adaptive Layout** and **Size Class**

With *Adaptive Layout*, our app can adapt UI to a particular device and device orientation.And *Size Class* is thhe concept to achieve that. *Size Class* identifies two types of dimensions: regular(large) and compact(small). 

![sizeclasses](../../chapter6/graph/sizeclasses.png)

![sizeclasses2](../../chapter6/graph/sizeclasses2.png)

So the reason is clearly: at first the mode is `wC hR`, everything looks good. While changes to `wC hC`, the height is too compact to hold the images and buttons.

Thus, the solution is here: choose the constraint between safe area top and stack view top, in the `Attribute inspector` menu, click the `+` button near the `Constant`. 

![sizeclasses3](../../chapter6/graph/sizeclasses3.png)

Since we only concern the height, set the width to *any*,the height to *compact*, the set the value to 15.

![sizeclasses](../../chapter6/graph/sizeclasses4.png)

Now, the change only takes effect in iPhone landscape mode.Now pay attention to the second problem.

Size classes can also apply for other property, not only constraint.Choose the stack view (the big one that contains image stack), in the `Attribute inspector` menu, click the `+` button near the `Alignment`. set the width to *any*,the height to *compact*, the set the value to `Center`, then the second problem fixed.

---

OK, still got a problem in iPhone SE landscape mode:

![iphonese](../../chapter6/graph/iphonese.png)

One way to solve this one is to hide the "need help" label in all iPhone landscape mode.(Is there any more solutions? ~~No, by far.~~ Yes, just make the two big stack a big one and adjust the dis between. But if do so, the size classes which are the purpose of this chapterare, are useless in this chapter.)Choose the "need help" label and find `Hidden` property in `Attribute inspector`, and set a new size class.

# Preserving Vector Data

Though vector has the advantage of high quality when scaling up or down, Xcode automatically converts it into three static images like image set `user2`, causing quality losing. And *Preserving Vector Data* solve this problem.To enable this, go to `Assets.scassets`, choose one image and click `Preserving Vector Data` in `Attribute inspector` menu.

In iPad Pro 12.9, the change are obvious between image1 and image3.

![PreservingVectorData](../../chapter6/graph/PreservingVectorData.png)