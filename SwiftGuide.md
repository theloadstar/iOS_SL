# The Basics

Types in Swift must have capitalized names, like the name **Swift** itself.

### Naming Constants and Variables

Constant and variable names can contain almost any character, including Unicode characters:

```swift
1. let π = 3.14159
2. let 你好 = "你好世界"
3. let 🐶🐮 = "dogcow"
```

> **Note**:
>
> If you need to give a constant or variable the same name as a reserved Swift keyword, surround the keyword with backticks (```) when using it as a name. However, avoid using keywords as names unless you have absolutely no choice.

### Print Function

By default, this function terminates the line it prints by adding a line break. To print a value without a line break after it, pass an empty string as the terminator—for example, `print(someValue, terminator: "")`. 

### Comments:

Swift allows multiline comments like following:

```swi
/* This is the start of the first multiline comment.
 /* This is the second, nested multiline comment. */
This is the end of the first multiline comment. */
```

### Semicolons

Unlike many other languages, Swift doesn’t require you to write a semicolon (`;`) after each statement in your code, although you can do so if you wish. However, semicolons *are* required if you want to write multiple separate statements on a single line:

```sw
1. let cat = "🐱"; print(cat)
2. // Prints "🐱"
```

### Integer

For usigned int -> `UInt`, for max or min of that -> `UInt.max` or `UInt.min`

### Numeric Literals

A literal value is a value that appears directly in your source code. For Numeric Literals, they can be written as:

* A *decimal* number, with no prefix
* A *binary* number, with a `0b` prefix
* An *octal* number, with a `0o` prefix
* A *hexadecimal* number, with a `0x` prefix

对于浮点数，可以使用十进制表示也可以使用十六进制（需要前缀`0x`）。对于十进制，底数为10；对于十六进制，底数为2。

以下表示均为`12.1875`

```sw
let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0
```

其中，第三行：`0xC.3p0 = (12+3/16)*2^0=12.1875`

此外，允许使用前置0或者下划线以增加可读性

```sw
let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1
```







