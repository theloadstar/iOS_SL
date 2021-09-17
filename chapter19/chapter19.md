This chapter goes to the **Core Data**! Oh, finally we came to database!!!

# Core Data

First of all, **Core Data** is not a database.It is actually a framework that lets developers interact with databases in an object-oriented way.

![coredatastack](graph/coredatastack.png)

* Managed Object Context:

  > Think of it as a scratch pad or temporary memory area containing objects that interact with data in the persistent store. Its job is to manage objects created and returned using Core Data framework. 

* Managed Object Model:

  > This describes the schema that you use in the app, the schema is represented by a collection of objects (also known as entities).In Xcode, the managed object model is defined in a file with the extension `.xcdatamodeld. `

* Persistent Store Coordinator:

  > It is the coordinator of the Core Data stack. It sits between the managed object context and the persistent store.While the figure shows a single store, a Core Data application can have multiple stores. The persistent store coordinator, an instance of NSPersistentStoreCoordinator, is the party responsible for managing different persistent object stores and saving the objects to the stores.

* Persistent Store:

  > This is the repository in which your data is actually stored. Usually, it's a database. SQLite is default.

个人总结（IMU）：简单说，core data 能够将OC对象转换为数据保存在SQLite库中，也能SQLite库中的数据转换为OC对象。上面的MOC就用来处理OC数据，可以理解为一个缓冲；PS用来管理实际的数据，也可以先理解为SQLite数据库。而MOM则定义了数据库的数据结构，即有什么属性啊、键值啊balbala的。PSC则负责协调MOC与PS之间的交互，毕竟一个是OC对象，一个是数据。可见下图：

![framework](graph/framework.png)

NSObject：通过 Core Data 从数据库取出的对象，默认情况下都是 NSManagedObject 对象

总结[参考](https://blog.csdn.net/zh952016281/article/details/52105683)，[这里](https://blog.csdn.net/q199109106q/article/details/8563438)也可以看看。

---

Okey, back to the tutorial.

> That looks complicated, right? Definitely. Apple's engineers were also aware of the issue. Starting from iOS 10, the team introduced a class called `NSPersistentContainer` to simplify the management of Core Data stack in your apps. `NSPersistentContainer` is the class you will deal with for saving and retrieving data.

# Use Core Data

We can check `core data` to apply it when creating project. For an exsiting one, we can just add codes to `AppDelegate.swift`.

```sw
// MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "FoodPin")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
```

1. **lazy**: A lazy type will not be load until being needed. See [here](https://zhuanlan.zhihu.com/p/29068547)

2. > The variable `persistentContainer` is an instance of `NSPersistentContainer`, and has been initialized with a persistent store named "CoreDataDemo". This container encapsulates(总结,概括) the Core Data stack in your application. Before iOS 10, you will need to create and manage the creation of the `managed object model (NSManagedObjectModel)`, `persistent store coordinator (NSPersistentStoreCoordinator)`, and the `managed object context (NSManagedObjectContext)`. The introduction of `NSPersistentContainer` simplifies all that. Later, you just use this variable to interact with the Core Data stack.

3. `saveContext()` provides data saving function.

# Create Data Model

Right-click `Food Pin` and add new file. Scroll down to select `Data Model`.Then, click the file and create a entity `Restaurant`. Add eight attributes to it. Note: we can't name a attribute 'description' because this one is reserved. So, we use `summary` instead.

Considering that when create a new restaurant, we don't know the name of the image. So, we set the type of image to `Binary Data`.

Uncheck the `name` and `type` attributes to make these two mandatory(强制的).

# Create Managed Objects



