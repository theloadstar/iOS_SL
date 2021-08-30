//
//  ViewController.swift
//  SimpleTable
//
//  Created by Ember on 2021/8/30.
//  Copyright © 2021 Ember. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats And Deli", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return the number of restaurant
        return restaurantNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentify = "datacell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentify, for: indexPath)
        
        cell.textLabel?.text = restaurantNames[indexPath.row]
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

