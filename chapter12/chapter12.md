# Navigation, scence and segues

*  Scence: refers to the on-screen content. In oter words, the current view on the device is a scence
* Segue: Transition among scences
* Navigation: segues' class (IMU)

# Create Navigation Controller

Choose *Restaurant Table View Controller Scence*, the in the top menu, *Editor -> Embed In -> Navigation Controller*.

![createnavigation](graph/createnavigation.png)

Change the name of *Navigation Item* in *Restaurant Table View Controller* to `Food Pin`

![renamenaviitem](graph/renamenaviitem.png)

![renamenaviitemre](graph/renamenaviitemre.png)

We can set the title to *Large Title* :

```sw
navigationController?.navigationBar.prefersLargeTitles = true
```

![largetitle](graph/largetitle.gif)