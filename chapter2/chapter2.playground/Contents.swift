import UIKit

//var str = "Hello, playground"
let constant = 10
var number = 5
var result = number + constant
number = 10
//constant = 5
var str = "Swift is awesome!"
str.count
str.uppercased()
str.lowercased()

var bookPrice = 39
var numOfCopies = 5
var totalPrice = bookPrice * numOfCopies
var totalPriceMessage = "The price of the book is $" + String(totalPrice)
var total2 = "The price of the book is $\(totalPrice)"

var getuptime = 7
if getuptime==7{
    print("cook yourself a breakfast")
}
else{
    print("go out to have a breakfast")
}

switch getuptime{
case 7:
    print("cook yourself")
default:
    print("go out")
}

var bookCollections = ["book1","book2"]
//add an element
bookCollections.append("book3")
//the number of bookCollection
bookCollections.count

for index in 0...2{
    print(bookCollections[index])
}

print("")

for book in bookCollections{
    print(book)
}
print("")
var collections = ["one":"book1","two":"book2","three":"book3"]
for (key) in collections{
    print(key)
//    print(value)
}

//exercise
var emojiDict : [String:String] = ["👻":"Ghost",
                                   "💩":"pop",
                                   "😱":"Scream",
                                   "👾":"Alien monster",
                                   "😠":"Angry"]

var wordToLookup = "👻"// Fill in the Ghost emoji //
var meaning = emojiDict[wordToLookup]// Fill in the code for accessing the value //
if let meaning = meaning{
    print(meaning)
}
wordToLookup = "😠"// Fill in the Angry emoji //
meaning = emojiDict[wordToLookup]// Fill in the code for accessing the value //
if let meaning = meaning{
    print(meaning)
}

var job:String?
job = "Coder"

//if job != nil{
//    let statement = "I am a"+job!
//    print(statement)
//}

if let job = job{
    let statement = "I am a "+job
    print(statement)
}

//UI
let containerView = UIView(frame: CGRect(x:0,y:0,width: 300,height: 300))
containerView.backgroundColor = UIColor.orange

let emojiLabel = UILabel(frame: CGRect(x:95,y:20, width: 150, height: 150))
emojiLabel.text = wordToLookup
emojiLabel.font = UIFont.systemFont(ofSize: 100.0)

containerView.addSubview(emojiLabel)

let meaningLabel = UILabel(frame: CGRect(x: 110, y: 100, width: 150, height: 150))
meaningLabel.text = meaning
meaningLabel.font = UIFont.systemFont(ofSize: 30)
meaningLabel.textColor = UIColor.white
containerView.addSubview(meaningLabel)

let DIYLabel = UILabel(frame: CGRect(x: 90, y: 150, width: 150, height: 150))
DIYLabel.text = "👻DIY🤣"
DIYLabel.font = UIFont.systemFont(ofSize: 30.0)
DIYLabel.textColor = UIColor.green
containerView.addSubview(DIYLabel)
