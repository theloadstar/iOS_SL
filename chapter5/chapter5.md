# Auto Layout

First, let's review the code we have learnt in the previous chapters.

```sw
@IBAction func showmessage(sender:UIButton){
	let alertcontroller = UIAlertController(title : "HELLO~", message : "Welcome TO Auto Layout!", preferredStyle : UIAlertController.Style.alert)
	
	alertcontroller.addAction(UIAlertAction(title : "OK~", style:UIAlertAction.Style.default, handler:nil))
	
	present(alertcontroller,animated:true,completion:nil)
}
```

