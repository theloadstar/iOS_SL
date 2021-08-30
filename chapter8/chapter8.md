# Table View

After drag a *table view* to the storyboard and resize it to fill the whole *safe area*, we can set the value of `Prototype Celll`  in the *Attribute inspector* from 0 to 1 to generate a prototype cell.

![thefirstprototypecell](graph/thefirstprototypecell.png)

We can think *prototype cell* as a cell template so that we can resuse it in all the table cells, in other words, it's a place where you can put text or image(in my understanding).

Set the identifier to `datacell`, this is the<font color = "red"> unique key for identifying the prototype cell, which will be used in coding later.</font>

![prototypeidentifier](graph/prototypeidentifier.png)

When I read to the autolayout part of tableview, I found sth new when practicing:

![spacetothenearest](graph/spacetothenearest.png)

Found sth?<font color = "red">NEAREST!!!</font> This means that the default one is not `Safe Area`. Besides, I prefer the table fill in the whole screen area, so set the corresponding value of each constraint to `superview` like this graph:

![superview](graph/superview.png)

As for `Constrain to margins`, here are some answer from stackoverflow:

> 1. In iOS 8 you now have the option to define your constrains relative to a predefined margin to the superview's bounds, instead of the superview's bounds themselves. Yes, it is totally related to the layout margins you pointed to in the docs. One advantage is that you may redefine your margins dynamically, or differently for each kind of device, and the layout will be updated correspondingly without modifying the constraints.
>
>    When to use it: when you want to take advantage of this new flexibility.
>
>    When to NOT use it: for any app targeted to run on iOS 7 or below.
>
> 2. 如果你点了constrain to margins，左右会有8个点的空挡，而是从8个点后开始计算约束，而没有点时，已屏幕的0点开始计算。

