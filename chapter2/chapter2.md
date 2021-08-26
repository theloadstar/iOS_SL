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

In Swift, `if-else` is similar with C/C++, except that the condition has no parenthesis`()` around.Here is an example:

```sw
var getuptime = 7
if getuptime==7{
	print("cook yourself a breakfast")
}
else{
	print("go out to have a breakfast")
}
```

`switch` is similar as well , except without `default`.

```sw
switch getuptime{
case 7:
    print("cook yourself")
default:
    print("go out")
}
```

Notice that there is no indentation(缩进) at the beginning of `case` line。

Besides, when using `switch` statement, we can use `...` to define a range from lower bound to upper bound(including two bounds) such as  `5000...9999`.

## Array and Dictionaries

### Array

There is no square brackets after the var-name:

```sw
var bookCollections = ["book1","book2"]
//add an element
bookCollections.append("book3")
//the number of bookCollection, no () behind
bookCollections.count
```

* `For Statement`

```sw
for index in 0...2{
    print(bookCollections[index])
}
for book in bookCollections{
    print(book)
}
```

Similar to `if-else` statement, there is no brakets around the condition statement.

<font color = "red">Notice:</font>the `print` of Swift has Auto-Feed function. If you execute `print("\n")`, you will get two newline!

### Dictionaries

```sw
var collections = ["one":"book1","two":"book2","three":"book3"]
for (key,value) in collections{
    print(key+" "+value)
//    print(value)
}
```

After several times trying, the sequence of result is total random. If we change the iterator `key,value` to just one element, the result will be as follows, the sequence is random as well.

```markdown
(key: "three", value: "book3")
(key: "one", value: "book1")
(key: "two", value: "book2")
```

We can define the dictionary's key-type and value-type explicitly like this, which can be omitted as well.

```sw
var emojiDict : [String:String] = ["👻":"Ghost",
                                   "💩":"pop",
                                   "😱":"Scream",
                                   "👾":"Alien monster",
                                   "😠":"Angry"]
```

## <font color = "red">Optional</font>

>Some developers struggle to understand the concept of Optionals. The fundamental idea is actually quite simple. Before accessing a variable that may have no value, Swift encourages you to verify it first. You have to make sure it has a value before any further processing. Thus, this can avoid app crashes.
>

Here is a question: 

```sw
var emojiDict : [String:String] = ["👻":"Ghost",
                                   "💩":"pop",
                                   "😱":"Scream",
                                   "👾":"Alien monster",
                                   "😠":"Angry"]

var wordToLookup = "👻"// Fill in the Ghost emoji //
var meaning = emojiDict[wordToLookup]// Fill in the code for accessing the value //
print(meaning)

wordToLookup = "😠"// Fill in the Angry emoji //
meaning = emojiDict[wordToLookup]// Fill in the code for accessing the value //
print(meaning)
```

The results:

```
Optional("Ghost")
Optional("Angry")
```

This means `meaning` may have no value. For example, if we change `"👻"` to `"👿"`, the corresponding result will be `nil`.

> Up till now, all the variables or constants we worked with have an initial value. This is a must in Swift. A non-optional variable gurantees to have a value.

If we have to define some var with no value, use the `optional` type by `?` like this:

```sw
var job:String ?
```

And since optional type can have no initial value, we must explicitly specify the type of optional type var.

* How can optional type help us write better code?

See the code below:

```sw
var job:String?
job = "Coder"
var statement = "I am a"+job
```

Xcode will report an error in line3, even if we assign a value to optinal type var job. We must perform verification to find out whether the optional has a value. which is called _Forced Unwrapping_.

### Forced Unwrapping

We can use `if-else` to achieve unwrapping:

```sw
if job != nil{
    var statement = "I am a"+job!
    print(statement)
}
```

<font color = "red">Two Notes:</font>

1. the operator `!=` must have whitespace on the both sides.
2. Do not forget the exclamation mark `!` at the end of line 2, which tells Xcode that you ensure the optional variable has a value, and it is safe to use.(**In fact, we can just add`!` to achieve that...**)

### Optional Binding

As we can see, using `!` to tell Xcode the var is safe to be wrapped is still unsafe, because Xcode won't report a warning or error when using `!` even if we don't assign any value to optional-type.

```sw
var job:String?
//job = "Coder"

//if job != nil{
    let statement = "I am a"+job!
    print(statement)
//}
```

Xcode won't report any errors or warnings until executing the program.

There is a better way to access the underlying value of an optional value called _Optional Binding_, which is recommanded.

```sw
if let jobwhite = job{
    let statement = "I am a "+jobwhite
    print(statement)
}
```

In fact , we can use the same name, because the first `job` is a temporary variable in `if-else` statement.

```sw
if let job = job{
    let statement = "I am a "+job
    print(statement)
}
```

We don't need to use `!` here 🥳