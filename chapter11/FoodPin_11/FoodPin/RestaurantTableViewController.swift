//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by Ember on 2021/8/31.
//  Copyright © 2021 Ember. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats And Deli", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]

    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    
    var RestaurantisChecked = Array(repeating: false, count: 21)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.cellLayoutMarginsFollowReadableWidth = true;
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    // MARK: - Table view Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // current cell
        let cell = tableView.cellForRow(at: indexPath)
        
        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .actionSheet)
        if let popoverController = optionMenu.popoverPresentationController{
            if let cell = tableView.cellForRow(at: indexPath){
                popoverController.sourceView = cell
                popoverController.sourceRect = cell.bounds
            }
        }
        // call action
        let callActionHandler = { (action:UIAlertAction!) -> Void in
            let alertMessage = UIAlertController(title: "Servise Unavailable", message: "This Servise is not ready yet", preferredStyle: .alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertMessage, animated: true, completion: nil)
        }
        let callAction = UIAlertAction(title: "Call"+"123-000-\(indexPath.row+1)", style: .default, handler: callActionHandler)
        optionMenu.addAction(callAction)
        
        //check-in action
        /*let CheckInHandler = { (action:UIAlertAction!) -> Void in
//            let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = .checkmark
        }
        optionMenu.addAction(UIAlertAction(title: "Check In", style: .default, handler: CheckInHandler))
        //uncheck in
        optionMenu.addAction(UIAlertAction(title: "UnCheck", style: .default, handler: {
            (action:UIAlertAction!)->Void in
//            let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = .none
        }))*/
        //two check
        let CheckHandler = {(action:UIAlertAction!) -> Void in
            cell?.accessoryType = ((self.RestaurantisChecked[indexPath.row]) == false) ? .checkmark : .none
            self.RestaurantisChecked[indexPath.row] = !self.RestaurantisChecked[indexPath.row]
        }
        let CheckTitle = ((self.RestaurantisChecked[indexPath.row]) == false) ? "Check In" : "Check Out"
        let CheckAction = UIAlertAction(title: CheckTitle, style: .default, handler: CheckHandler)
        optionMenu.addAction(CheckAction)
        
        optionMenu.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(optionMenu, animated: true, completion: nil)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurantNames.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "datacell", for: indexPath) as! RestaurantTableViewCell
//        cell.textLabel?.text = restaurantNames[indexPath.row]
//        cell.imageView?.image = UIImage(named: restaurantNames[indexPath.row])
        cell.nameLabel.text = restaurantNames[indexPath.row]
        cell.thumbnailImageView.image = UIImage(named: restaurantNames[indexPath.row])
        cell.locationLabel.text = restaurantLocations[indexPath.row]
        cell.typeLabel.text = restaurantTypes[indexPath.row]
        cell.accessoryType = (RestaurantisChecked[indexPath.row] == false) ? .none : .checkmark
        
        return cell
    }
    
    // swipe for deletion
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            restaurantNames.remove(at: indexPath.row)
//            RestaurantisChecked.remove(at: indexPath.row)
//            restaurantTypes.remove(at: indexPath.row)
//            restaurantLocations.remove(at: indexPath.row)
//
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        }
//    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){ (action, sourceView, completionHandler) in
            //delete row
            self.restaurantNames.remove(at: indexPath.row)
            self.restaurantLocations.remove(at: indexPath.row)
            self.restaurantTypes.remove(at: indexPath.row)
            self.RestaurantisChecked.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            //dismiss the action button
            completionHandler(true)
        }
        
        let shareAction = UIContextualAction(style: .normal, title: "Share"){(action, sourceView, completionhandler) in
            let defaultText = "Just Checking in at " + self.restaurantNames[indexPath.row]
            let activilityController : UIActivityViewController
            if let shareImage = UIImage(named: self.restaurantNames[indexPath.row]){
                activilityController = UIActivityViewController(activityItems: [defaultText, shareImage], applicationActivities: nil)
            }
            else {
                activilityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            }
            self.present(activilityController, animated: true, completion: nil)
            
            completionhandler(true)
        }
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction, shareAction])
        return swipeConfiguration
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
