There two types of *Quick Actions*: *Static* and *Dynamic*.As the name suggests: the former is static and hardcoded in the `Info.plist`.  The latter can be updated at runtime.

For a quick action, there are five properities:

> * **UIApplicationShortcutItemType **(required) - a unique identifier used to identify the quick action. It should be unique across all apps. So a good practice is to prefix the identifier with the app bundle ID (e.g. com.appcoda.).
> * **UIApplicationShortcutItemTitle** (required) - the name of the quick action visible to the user.
> * **UIApplicationShortcutItemSubtitle** (optional) - the subtitle of the quick action. It is an optional string displayed right below the title of the quick action.
> * **UIApplicationShortcutItemIconType** (optional) - an optional string to specify the type of an icon from the system library. 
> * **UIApplicationShortcutItemIconFile** (optional) - if you want to use your own icon, specify the icon image to use from the app's bundle. Alternatively, specify the name of the image in an asset catalog. 
> * **UIApplicationShortcutItemUserInfo** (optional) - an optional dictionary containing some extra information you want to pass. For example, one use for this dictionary is to pass the app version.

Insert following code in `WalkThroughViewController`

```sw
//MARK: - QuickAction
    func createQuickAction(){
        if traitCollection.forceTouchCapability == UIForceTouchCapability.available{
            if let bundleIdentifier = Bundle.main.bundleIdentifier{
                let shortcutItem1 = UIApplicationShortcutItem(type: "\(bundleIdentifier).OpenFavourites", localizedTitle: "Show Favourites", localizedSubtitle: nil, icon: UIApplicationShortcutIcon(templateImageName: "favourite"), userInfo: nil)
                
                let shortcutItem2 = UIApplicationShortcutItem(type: "\(bundleIdentifier).OpenDiscover", localizedTitle: "Show Discover", localizedSubtitle: nil, icon: UIApplicationShortcutIcon(templateImageName: "discover"), userInfo: nil)
                let shortcutItem3 = UIApplicationShortcutItem(type: "\(bundleIdentifier).NewRestaurant", localizedTitle: "New Restaurant", localizedSubtitle: nil, icon: UIApplicationShortcutIcon(type: .add), userInfo: nil)
                UIApplication.shared.shortcutItems = [shortcutItem1,shortcutItem2,shortcutItem3]
            }
        }
    }
```

1. `traitCollection`:The traits, such as the size class and scale factor, that describe the current environment of the object.描述物体当前环境的特征，如尺寸类别和比例因子。

   If the device support 3D touch, then `forceTouchCapability` will be set to `UIForceTouchCapability.available`.

2. `UIApplicationShortcutIcon(templateImageName`:

   ![template](graph/template.png)

   Call this method after `UserDefaults.standard.set(true, forKey: "hasVisitedWalkThrough")` so that user can only see the quick action after walkthrough.

   BTW, if we don't call this method, quick action still works. The reason lies in line 9.

   ![image-20210930174836651](graph/3Dtouch.png)

   <font color = "red">Note:</font> By far this feature only works in devices that support 3D-touch, regardless simulator or real devices.

















