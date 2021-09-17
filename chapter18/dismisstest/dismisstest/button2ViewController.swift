//
//  button2ViewController.swift
//  dismisstest
//
//  Created by Ember on 2021/9/17.
//  Copyright © 2021 Ember. All rights reserved.
//

import UIKit

class button2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let browserToolbar = UIToolbar(frame: CGRect(x: 20, y: 20, width: 320, height: 44))
        self.view.addSubview(browserToolbar)
        // Do any additional setup after loading the view.
    }
    @IBAction func close2(sender: AnyObject){
        dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
