This chapter, we will use Web related APIs.

# *About* View

Drag a *View* object right above the table cell and set the height to `120`.Then, drag a imageView to it, width/height:142/53, set to the center and the image `foodpin-`.Then, set the identifier of table cell to `AboutCell` and style to `Basic`.

As usual, we need to create a controller for it.After creating `AboutTableViewController`, set the table's class to it.This time's code is a little different: introducing new type, **Tuples**, easy to understand.

```sw
var sectionContent = [[(image:"store", text:"Rate us on App Store", link: "https://www.apple.com/ios/appstore"), (image:"chat", text:"Tell us your feedback", link: "www.appcoda.com/contact")],[(image:"twitter", text:"Twitter", link:"https://twitter.com/appcodamobile"), (image:"facebook", text:"Facebook", link:"https://facebook.com/appcodamobile"), (image:"instagram", text:"Instagram", link:"https://www.instagram.com/appcodadotcom")]]
```

```sw
override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sectionContent.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sectionContent[section].count
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
```

The method `titleForHeaderInSection section` is used to display the section title.

```sw
override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AboutCell", for: indexPath)

        // Configure the cell...
        let cellData = sectionContent[indexPath.section][indexPath.row]
        cell.textLabel?.text = cellData.text
        cell.imageView?.image = UIImage(named: cellData.image)

        return cell
    }
```

Pay attention to line 2's Identifier!

Let's do some customizations.

```sw
override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        //for iPad readable
        tableView.cellLayoutMarginsFollowReadableWidth = true
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        if let customFont = UIFont(name: "Rubik-Medium", size: 40.0){
            navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor(231, 76, 60), NSAttributedString.Key.font: customFont]
        }
        //hide the blank cells
        tableView.tableFooterView = UIView()
    }
```

The last line is used for hidding the blank cells.

![AboutCell](graph/AboutCell.jpg)