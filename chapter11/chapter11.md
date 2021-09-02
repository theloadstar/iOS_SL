Select, delete, insert and update are the basic operations when dealing with data. We've realized how to select, let's achieve deleting.

# MVC

* Model:

  responsible for holding the data or any operations on the data. The simplest model is *Array*.

* View:

  manages the visual display of information.

* Controller;

  a bridge between the model and the view. It translates the user interaction from the view (e.g. tap) into the appropriate action to be performed in the model.


# Enable the Swipe-to-delete feature

Insert these lines:

```sw
override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
    }
```

![swipetodelete](graph/swipetodelete.png)

From the discussion, we can infer that this function can receive either delete or insert action by the par `editingStyle`

Then we got result like this:

![swipetodeletere](graph/swipetodeletere.png)

# Delete element in the model and Reload

```sw
if editingStyle == .delete {
            restaurantNames.remove(at: indexPath.row)
            RestaurantisChecked.remove(at: indexPath.row)
            restaurantTypes.remove(at: indexPath.row)
            restaurantLocations.remove(at: indexPath.row)
            tableView.reloadData()
        }
```

Easy to understand. However, we don't need to reload the whole tableView, just delete the specified row of it using methhod `deleteRows(at: with: )`

```
tableView.deleteRows(at: [indexPath], with: .fade)
```

BTW, in addition to `.fade`, I tried `.left` `.right` `.top`, but did't see any difference.

# Swipe to more

If we just need to implement the swipe to delete function in our app, the above method is good enough. However, if we won't to swipe for more, it's far from enough. We need to use `UIContextualAction` Class. So, delete above code first. 

There are two methods : `tableView(_:leadingSwipeActionsConfigurationForRowAt:)` (swipe to right, display in leading),  `tableView(_:trailingSwipeActionsConfigurationForRowAt:)`(swipe to left, display in trailing)

Let's put the code first and analyze line by line.

```
override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){ (action, sourceView, completionHandler) in
            //delete row
            self.restaurantNames.remove(at: indexPath.row)
            self.restaurantLocations.remove(at: indexPath.row)
            self.restaurantTypes.remove(at: indexPath.row)
            self.RestaurantisChecked.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            //dismiss the action button
            completionHandler(true)
        }
        
        let shareAction = UIContextualAction(style: .normal, title: "Share"){(action, sourceView, completionhandler) in
            let defaultText = "Just Checking in at " + self.restaurantNames[indexPath.row]
            let activilityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            self.present(activilityController, animated: true, completion: nil)
            
            completionhandler(true)
        }
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction, shareAction])
        return swipeConfiguration
    }
```

* line2 : `UIContextualAction`:

  > Create `UIContextualAction` objects to define the types of actions that can be performed when the user swipes left or right on a table row. 

  ![UIContextualActionStyle](graph/UIContextualActionStyle.png)

  ![UIContextualActionHandler](graph/UIContextualActionHandler.png)

* `completionHandler`:这里的Handler没有写代码块，直接传入一个true参数，我的理解为其默认功能是使选中的按钮消失。见下图，如果我们把shareaction的此行注释掉，则左滑动作不会自动消失。deleteaction由于会删除整行，看不出来

<img src="graph/completionhandler.jpg" alt="completionhandler2"  />

* `UIActivityViewController`:

  > The system provides several standard services, such as copying items to the pasteboard, posting content to social media sites, sending items via email or SMS, and more. Apps can also define custom services.

  ![UIActivityViewController](graph/UIActivityViewController.png)

  就是平时经常看到的空投的那个分享页面

* `UISwipeActionsConfiguration`:

  > The set of actions to perform when swiping on rows of a table.
  >
  > Create a `UISwipeActionsConfiguration` object to associate custom swipe actions with a row of your table view. 

In addition to share text content, we can also share an image like this:

```sw
let activilityController : UIActivityViewController
            if let shareImage = UIImage(named: self.restaurantNames[indexPath.row]){
                activilityController = UIActivityViewController(activityItems: [defaultText, shareImage], applicationActivities: nil)
            }
            else {
                activilityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            }
            self.present(activilityController, animated: true, completion: nil)
```

(最基本的编程常识还是得有的啊，怎么能直接在if-else里定义activityController呢🤦‍♂️)

results:

<img src="graph/shareimage.jpg" alt="shareimage"  />

Note the difference between the share view with the former one.

# SF Symbols

>  integrate seamlessly with the San Francisco system font

As long as our devices run iOS 13, we can use this Symbols. And Apple provides a Mac app *SF Symbols* for developers to explore the symbols.

![SFSymbols](graph/SFSymbols.png)

Now we can use the symbols to customize our swipe-left buttons.Just add `.image` of `UIContextualAction` like this:

```sw
deleteAction.backgroundColor = UIColor(red: 242/255, green: 38/255, blue: 19/255, alpha: 1.0)
deleteAction.image = UIImage(systemName: "trash")
```

As for `UIColor`, easy to understand. We can get color RGB value from [Adobe](https://color.adobe.com/zh/create/color-wheel) or [Flat](https://www.flatuicolorpicker.com/orange-rgb-color-model/)

This section I did'n download the zip file the tutorial mentions, which is blank after unzipping.

![SFSymbolsRE](graph/SFSymbolsRE.png)

The system name can get from *SF Symbols* Mac App.

# Crash Again !!! On iPad...(;´༎ຶД༎ຶ`)

<font color = "red">Remember</font>: everytime we code a **view controller**, think about **popoverview** !

# Exercise

Honestly speaking, I like this exercise, which is a bit challenging.

Okey, here it comes:

1. Let's take *heart-tick* image back like exercise2 of last chapter, using `.isHidden` this time~

   ```sw
   self.RestaurantisChecked[indexPath.row] = !self.RestaurantisChecked[indexPath.row]
               cell.HeartImageView.isHidden = !(self.RestaurantisChecked[indexPath.row])
   ```

   <font color = "red">Pay attition to these two lines sequence !!!</font>

2. 