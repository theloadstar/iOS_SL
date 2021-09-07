<font color = "red">本章工程文件与chapter13为同一个</font>

# Customize your own font

We can drag the fonts to project navigator, and in order manage files easier, use **group*8 feature.

![fonts](graph/fonts.png)

![fonts2](graph/fonts2.png)

# Design your table view header

> Each table view has its own header view. This header view resides on top of the table cells. The header view is empty by default, but you are allowed to add your own view to that.
>

The `view` of Detail view controller should be removed as well. Drag a *TableView* to it, and Xcode automatically resize the tableview to fill the whole screen. Set the number of *Prototype Cells* to `2` this time. Drag a `View` (<font color = "red">Note</font>, `View`, no any prefix) to the top of cells and adjust its height to `350`. This view serves as the container view holding other elements which will be added later. Rename the view to `header view`. (So the Header View must be added ourselves....)Header View doesn't need to set constraints.

Then, drag an *Image View* and config, adding four constraints.

Next, the *Name Label*: ![labelconf](graph/labelconf.png)

*Type Label*: width:100 height:20 background-color:red font-color:white font:as following

![typelabelconf](graph/typelabelconf.png)

Heart Image View: 15x15

Let's set some constraints now:![typelabelcons](graph/typelabelcons.png)

Change the width constraint of *Type Label* form `Equal` to `Greater`. For the align of small image, use `control`+`drag`

![control-drag](graph/control-drag.png)

For the *Name Label*, use the same method to set the mode to `Leading`, and trailing >=50

# Header Code

Create class `RestaurantDetailHeaderView` , code outlets and make connections.

---

写到这里的时候突然被左边大纲的文件结构启发，对chapter12的To-Do有了新的想法，具体见chapter12 To-Do部分

---

Go to `RestaurantDetailViewController`, define two outlets for `TableView` and `HeaderView`:

```sw
@IBOutlet var tableView : UITableView!
@IBOutlet var headerView : RestanrantDetailHeaderView!
```

Then, in `viewDidload()`