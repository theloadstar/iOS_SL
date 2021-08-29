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