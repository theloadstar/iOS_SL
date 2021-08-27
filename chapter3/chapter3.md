This chapter uses _Single View Application_ to develop the first simple iOS app.

# Main.storyboard

layout as follows:

![storyboard_layout](graph/story_layout.png)

* Each screen of an app is usually represented by a view controller.
* views are the basic building blocks for creating your user interface.
* A view controller is designed to manage its associated view and subviews (e.g. button and label).
* A scene in storyboard represents a view controller and its views.


# Get Started

* Use `cmd`+`=` to auto-resize one object like a button

  ![auto_resize](graph/auto_resize.png)

* Code in the file `ViewController` to design the button action

  ```sw
  @IBAction func showMessage(sender:UIButton){
          //指示框的标题、内容
          let alertController = UIAlertController(title: "Welcome to my first app AGAIN!!!🥳", message: "HELLO! iOS!", preferredStyle: UIAlertController.Style.alert)
          //指示框的动作
          alertController.addAction(UIAlertAction(title: "OK~", style: UIAlertAction.Style.default, handler: nil))
          //暂时不晓得，激活动画？
          present(alertController,animated: true,completion: nil)
      }
  ```

* Since the code and the user interface are separated, we need to connect them. Back to the `Main.storyboard`, press and hold `control`, drag the button to the `View Controller` icon.

  <img src="graph/getstart_connect.png" alt="getstart_connect" style="zoom:50%;" />

  Here comes the result:

  <img src="graph/result_1.png" alt="result_1" style="zoom:50%;" />

---

* DIY TIME

  If I change the style `alert` to `actionSheet` in line3, the result will be like this:

  <img src="graph/result_2.png" alt="result_2" style="zoom:33%;" />

---

* We can also change the color of the button. Select the button and then we will see.

  <img src="graph/change_button_color.png" alt="change_button_color" style="zoom:33%;" />

  # Exercise

  Not so hard

  ```sw
  @IBAction func showMessage(sender:UIButton){
          
          let emojiDictionary = ["👾":"Alien Monster",
                                 "😈":"Little Evil",
                                 "👻":"Little Monster",
                                 "🥴":"Drunk"]
          //get the selected button
          let selectedbutton = sender
          if let wordtoLookup = selectedbutton.titleLabel?.text{
              let meaning = emojiDictionary[wordtoLookup]
              //指示框的标题、内容
              let alertController = UIAlertController(title: "Meaning~🥳", message: meaning, preferredStyle: UIAlertController.Style.alert)
              //指示框的动作
              alertController.addAction(UIAlertAction(title: "OK~Got it!", style: UIAlertAction.Style.default, handler: nil))
              //暂时不晓得激活动画？
              present(alertController,animated: true,completion: nil)
          }
          
          
      }
  ```

  result:

  &emsp;&emsp;&emsp;<img src="graph/exercise_result_1.png" alt="exercise_result_1" style="zoom: 40%;" /> <img src="graph/exercise_result_2.png" alt="exercise_result_2" style="zoom: 40%;" />

# To Do

- [ ] What's this line for? If commented, the button won't work; but if I change the `true` to `false`, nothing seems to change.

  ```sw
  present(alertController,animated: true,completion: nil)
  ```

- [ ] In the line9 of exercise code `selectedbutton.titleLabel?.text`, is the mark `?` means that the `selectedbutton.titleLabel` is a optional type?