//
//  RestaurantDetailViewController.swift
//  FoodPin
//
//  Created by Ember on 2021/9/3.
//  Copyright © 2021 Ember. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController {

    var restaurant = Restaurant()
    
    @IBOutlet var tableView : UITableView!
    @IBOutlet var headerView : RestanrantDetailHeaderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        headerView.nameLabel.text = restaurant.name
        headerView.typeLabel.text = restaurant.type
        headerView.headerImageView.image = UIImage(named: restaurant.image)
        headerView.heartImageView.isHidden = (restaurant.isVisited) ? false : true
        // Do any additional setup after loading the view.
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
