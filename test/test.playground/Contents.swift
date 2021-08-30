import UIKit

var str = "Hello, playground"

func join(s1: String, s2: String, joiner: String = " ") -> String {
    return s1 + joiner + s2
}
// call the function.
join(s1: "hello", s2: "world", joiner: "-")

func join2(_ s1: String, _ s2: String, for joiner: String = " ") -> String {
    return s1 + joiner + s2
}
// call the function.
join2("hello", "world", for: "-")
