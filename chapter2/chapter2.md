# Skills You Need

1. Learn Swift

2. Learn Xcode

3. Learn and <font color = "red">Understand</font> iOS Software Development Kit

   The third one is the most important, in my opinion.

# Get familiar with Swift with a Playground

这一节通过Playground熟悉基本的Swift语法，并不是很难。

This part aims to getting familiar with Swift basic grammar with a Playground, which is not so difficult.

## Constants and Variables

Swift uses `let` to define constant type, while using `var` to define variable type

```Sw
let constant = 10
var number = 5
var result = number + constant
number = 10
constant = 5 //illegal
```

> Tips: using `shift+cmd+Endter` to execute the code

In fact, the code above can be explicitly written as fllows:

```sw
let constant:Int = 10
var number:Int = 5
var result:Int = number + constant
```

Besides `Int`, we can use `Double`, `String`, `Bool` and so on to indicate a var/const type.Remember that the first latter of typename is <font color = "red">capital</font>. Thanks to the _Type Inference_ feature, we can omit(缺省) the type when declaring, the Swift compiler can deduce(推断) the type by examing the default value given by us.

> “In Playgrounds, you can hold the option key, and click any variable name to reveal the variable type, deduced by the compiler.”

## String

Swift uses the dot synax to access the build-in methods and the properties of a variable.

```sw
var str = "Swift is awesome!"
str.count //the length of str, no()
str.uppercased()
str.lowercased()
```

Adding two String var is easy, just using the operator `+`. However, we can't add two different type var in the same way:

```sw
var bookPrice = 39
var numOfCopies = 5
var totalPrice = bookPrice * numOfCopies
var totalPriceMessage = "The price of the book is $" + totalPrice //error
```

Swift is a _type-safe_ language, we can't concatenate two different together. So we need to convert one type to another. Unlike the C/C++, the converting of type in Swift is like `Typename(var)`, remember the capital latter.

```sw
var bookPrice = 39
var numOfCopies = 5
var totalPrice = bookPrice * numOfCopies
var totalPriceMessage = "The price of the book is $" + String(totalPrice)
```

There is a better way to do so, called _String interpolations_:

```sw
var totalPriceMessage = "The price of the book is $ \(totalPrice)"
```

_String interpolations_ is the recommended way to build a string from multiple types. You wraps the variable for string conversion in parentheses(小括号), prefixed(前缀) by a backslash(反斜杠).

## Control Flow Basics

> As far as the confidence goes, I think you will appreciate that it is not because you succeeded at everything you did, but because with the help of your friends, you were not afraid to fail.















