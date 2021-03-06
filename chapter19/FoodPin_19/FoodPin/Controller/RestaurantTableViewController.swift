//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by Ember on 2021/8/31.
//  Copyright © 2021 Ember. All rights reserved.
//

import UIKit
import CoreData

class RestaurantTableViewController: UITableViewController, NSFetchedResultsControllerDelegate{
    
    var restaurants: [RestaurantMO] = []
    // MARK: - View Controller Life Cycle
    override func viewDidLoad() {
//        print("1")
        super.viewDidLoad()
        tableView.cellLayoutMarginsFollowReadableWidth = true;
        navigationController?.navigationBar.prefersLargeTitles = true
        //chapter15
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        //font
//        print("Largebefore")
        if let customFont = UIFont(name: "Rubik-Medium", size: 40.0){
//            print("Large1")
            navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor(red: 231/255, green: 76/255, blue: 60/255, alpha: 1.0), NSAttributedString.Key.font: customFont]
//            print("Large")
        }
//        print("Largeafter")
        //hide bar
        navigationController?.hidesBarsOnSwipe = true
//        print("Table")
//        print("2")
        //empty background
        tableView.backgroundView = emptyRestaurantView
        tableView.backgroundView?.isHidden = true
//        if restaurants.count>0{
//            tableView.backgroundView?.isHidden = true
//            tableView.separatorStyle = .singleLine
//        }
//        else{
//            tableView.backgroundView?.isHidden = false
//            tableView.separatorStyle = .none
//        }
        //fetch data using NSFetchedResultsController
        let fetchRequest : NSFetchRequest<RestaurantMO> = RestaurantMO.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate){
            let context = appDelegate.persistentContainer.viewContext
            fetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        }
        fetchResultController.delegate = self
        do{
            try fetchResultController.performFetch()
            if let fetchedObjects = fetchResultController.fetchedObjects{
                restaurants = fetchedObjects
            }
        }catch{
            print(error)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        print("table appear")
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = true
//        print("table disappear")
//        fetch the data simple API
//        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate){
//            let request : NSFetchRequest<RestaurantMO> = RestaurantMO.fetchRequest()
//            let context = appDelegate.persistentContainer.viewContext
//            do{
//                restaurants = try context.fetch(request)
//            }
//            catch{
//                print(error)
//            }
//        }
        
    }
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type{
        case .insert:
            if let newIndexPath = newIndexPath{
                tableView.insertRows(at: [newIndexPath], with: .fade)
            }
        case .delete:
            if let indexPath = indexPath{
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        case .update:
            if let indexPath = indexPath{
                tableView.reloadRows(at: [indexPath], with: .fade)
            }
        default:
            tableView.reloadData()
        }
        if let fetchedObject = controller.fetchedObjects{
            restaurants = fetchedObject as! [RestaurantMO]
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
    // MARK: - Table view Delegate
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){ (action, sourceView, completionHandler) in
            if let appdelegate = (UIApplication.shared.delegate as? AppDelegate){
                let context = appdelegate.persistentContainer.viewContext
                let restaurantToDelegate = self.fetchResultController.object(at: indexPath)
                context.delete(restaurantToDelegate)
                appdelegate.saveContext()
            }
            //dismiss the action button
            completionHandler(true)
        }
        
//        deleteAction.backgroundColor = UIColor(red: 242/255, green: 38/255, blue: 19/255, alpha: 1.0)
        //after extension
        deleteAction.backgroundColor = UIColor(242, 38, 19)
        deleteAction.image = UIImage(systemName: "trash")
        let shareAction = UIContextualAction(style: .normal, title: "Share"){(action, sourceView, completionhandler) in
            let defaultText = "Just Checking in at " + self.restaurants[indexPath.row].name!
            let activilityController : UIActivityViewController
            if let restaurantimage = self.restaurants[indexPath.row].image ,let shareImage = UIImage(data: restaurantimage as Data){
                activilityController = UIActivityViewController(activityItems: [defaultText, shareImage], applicationActivities: nil)
            }
            else {
                activilityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            }
            //for iPad
            if let popoverController = activilityController.popoverPresentationController{
                if let cell = tableView.cellForRow(at: indexPath){
                    popoverController.sourceView = cell
                    popoverController.sourceRect = cell.bounds
                }
            }
            
            self.present(activilityController, animated: true, completion: nil)
            
            completionhandler(true)
        }
        
        shareAction.backgroundColor = UIColor(red: 232/255, green: 126/255, blue: 4/255, alpha: 1)
        shareAction.image = UIImage(systemName : "square.and.arrow.up")
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction, shareAction])
        return swipeConfiguration
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let CheckAction = UIContextualAction(style: .normal, title: nil){(action, sourceView, completionhandler) in
            let cell = tableView.cellForRow(at: indexPath) as! RestaurantTableViewCell
            self.restaurants[indexPath.row].isVisited = !self.restaurants[indexPath.row].isVisited
            cell.HeartImageView.isHidden = !(self.restaurants[indexPath.row].isVisited)
            completionhandler(true)
        }
        CheckAction.backgroundColor = UIColor(red: 38/255, green: 166/255, blue: 91/255, alpha: 1.0)
        CheckAction.image = UIImage(systemName: (restaurants[indexPath.row].isVisited) ? "arrow.uturn.left" : "checkmark")
        
        let swipeConfig = UISwipeActionsConfiguration(actions: [CheckAction])
        return swipeConfig
    }

    // MARK: - Table view data source
    
    @IBOutlet var emptyRestaurantView : UIView!
    
    var fetchResultController: NSFetchedResultsController<RestaurantMO>!
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        if restaurants.count>0{
            tableView.backgroundView?.isHidden = true
            tableView.separatorStyle = .singleLine
        }
        else{
            tableView.backgroundView?.isHidden = false
            tableView.separatorStyle = .none
        }
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurants.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "datacell", for: indexPath) as! RestaurantTableViewCell
        
        //Configure the cell
        cell.nameLabel.text = restaurants[indexPath.row].name
        //cell.thumbnailImageView.image = UIImage(named: restaurants[indexPath.row].image)
        if let restaurantImage = restaurants[indexPath.row].image{
            cell.thumbnailImageView.image = UIImage(data: restaurantImage as Data)
        }
        cell.locationLabel.text = restaurants[indexPath.row].location
        cell.typeLabel.text = restaurants[indexPath.row].type
        cell.HeartImageView.isHidden = !(restaurants[indexPath.row].isVisited)
        
        return cell
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showRestaurantDetail"{
            if let indexPath = tableView.indexPathForSelectedRow{
                let destinationController = segue.destination as! RestaurantDetailViewController
                destinationController.restaurant = restaurants[indexPath.row]
//                print("Detail_Segue")
            }
        }
    }
    
    @IBAction func unwindtohome(segue: UIStoryboardSegue){
        dismiss(animated: true, completion: nil)
    }

}
