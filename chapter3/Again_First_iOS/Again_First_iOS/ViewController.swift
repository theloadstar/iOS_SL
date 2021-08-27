//
//  ViewController.swift
//  Again_First_iOS
//
//  Created by Ember on 2021/8/27.
//  Copyright © 2021 Ember. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

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
            //暂时不晓得🤷‍♂️激活动画？
            present(alertController,animated: true,completion: nil)
        }
        
        
    }
}

