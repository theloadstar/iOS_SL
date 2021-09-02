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