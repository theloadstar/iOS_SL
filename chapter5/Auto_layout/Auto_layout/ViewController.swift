//
//  ViewController.swift
//  Auto_layout
//
//  Created by Ember on 2021/8/28.
//  Copyright © 2021 Ember. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showmessage(send:UIButton){
        let alertcontroller = UIAlertController(title: "Hello!", message: "Welcome to chapter5: Auto Layout!", preferredStyle: UIAlertController.Style.alert)
        
        alertcontroller.addAction(UIAlertAction(title: "OK!", style: UIAlertAction.Style.default, handler: nil))
        
        present(alertcontroller, animated: true, completion: nil)
    }
}

