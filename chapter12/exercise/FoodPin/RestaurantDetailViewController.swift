//
//  RestaurantDetailViewController.swift
//  FoodPin
//
//  Created by Ember on 2021/9/3.
//  Copyright © 2021 Ember. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController {

    var restaurantImageName = ""
    @IBOutlet var restaurantImageView : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        navigationItem.largeTitleDisplayMode = .always
        restaurantImageView.image = UIImage(named: restaurantImageName)
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
