This chapter mainly talks about the concept of **Object Oriented Programming**, aka **OOP** in short.

# Why OOP?

> First, why OOP? One important reason is that we want to decompose complex software into smaller pieces (or building block) which are easier to develop and manage. Here, the smaller pieces are the objects. Each object has its own responsibility, and objects coordinate with each other in order to make the software work. That is the basic concept of OOP.

# properties and functionalities

Like a car, its color, model, top speed are properties, while accelerate, brake, steering are functionalities. We can treat **method** and **functionalities** the same one.

# Class, Objects and instance

Class is easy to understand, and **Objects** represent all the **instance** of one Class. For the sake of simplicity, **Object** and **instance** are sometimes interchangeable.

> A blueprint for a house design is like a class description. All the houses built from that blueprint are objects of that class. A given house is an instance.

# Create a brand new Class

We can create a brand class to store the array info in `RestaurantTableViewController`

This time, create a `Swift File` rather than `Cocoa Touch Class`.

```sw
class Restaurant {
    var name : String
    var type : String
    var location : String
    var image : String
    var isVisited : String
    
    init(name: String, type: String, location: String, image: String, isVisited: String) {
        self.name = name
        self.type = type
        self.location = location
        self.image = image
        self.isVisited = isVisited
    }
    
    convenience init(){
        self.init(name: "", type: "", location: "", image: "", isVisited: "")
    }
}
```

The first **init** func is called `Designated Initializer`, while the second is called as its name.Then , replace current arrays with `Restaurant` Class arrays.（这可是个大工程，直接CV了🤦‍♂️BTW，refer里的图片名都是小写，自己的示例里都是大写，得替换一下。。。）

Next, adjust the *Red Error* code.

Besides, we need to change `RestaurantDetailViewController` as well.

```sw
var restaurant = Restaurant()
    @IBOutlet var restaurantImageView : UIImageView!
    @IBOutlet var NameLabel : UILabel!
    @IBOutlet var TypeLabel : UILabel!
    @IBOutlet var LocationLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        navigationItem.largeTitleDisplayMode = .always
        restaurantImageView.image = UIImage(named: restaurant.image)
        NameLabel.text = restaurant.name
        TypeLabel.text = restaurant.type
        LocationLabel.text = restaurant.location
    }
```

After this, the **Navigation** part of `RestaurantTableViewController` will be like this:

```sw
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showRestaurantDetail"{
            if let indexPath = tableView.indexPathForSelectedRow{
                let destinationController = segue.destination as! RestaurantDetailViewController
                destinationController.restaurant = restaurants[indexPath.row]
            }
        }
    }
```

By now, we have refactored our code by defining a new class `Restaurant`

# Organizing Your Xcode Project Files

Use Xcode's *group* feature to organize our files.Just click a file and right-click -> new group