//
//  RestaurantDetailViewController.swift
//  FoodPin
//
//  Created by Ember on 2021/9/3.
//  Copyright © 2021 Ember. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var restaurant = Restaurant()
   
    @IBOutlet var tableView : UITableView!
    @IBOutlet var headerView : RestanrantDetailHeaderView!
    
    // MARK: Life Cycle
    override func viewDidLoad() {
//        print("restaurant.name")
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        headerView.nameLabel.text = restaurant.name
        headerView.typeLabel.text = restaurant.type
        headerView.headerImageView.image = UIImage(named: restaurant.image)
        headerView.heartImageView.isHidden = !(restaurant.isVisited)
        //connections
        tableView.delegate = self
        tableView.dataSource = self
        //separate
//        tableView.separatorStyle = .none
        // navigation bar
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.tintColor = .white
        tableView.contentInsetAdjustmentBehavior = .never
        //show bar
        navigationController?.hidesBarsOnSwipe = false
        print("Detail")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("detail appear")
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
//        print("detail disappear")
    }
    
    // MARK: DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailIconTextCell.self), for: indexPath) as! RestaurantDetailIconTextCell
            cell.iconImageView.image = UIImage(systemName: "phone")?.withTintColor(.black, renderingMode: .alwaysOriginal)
            cell.shortTextLabel.text = restaurant.phone
            cell.selectionStyle = .default
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailIconTextCell.self), for: indexPath) as! RestaurantDetailIconTextCell
            cell.iconImageView.image = UIImage(systemName: "map")?.withTintColor(.black, renderingMode: .alwaysOriginal)
            cell.shortTextLabel.text = restaurant.location
            cell.selectionStyle = .none
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailTextCell.self), for: indexPath) as! RestaurantDetailTextCell
            cell.descriptionLabel.text = restaurant.description
            cell.selectionStyle = .none
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailSeparatorCell.self), for: indexPath) as! RestaurantDetailSeparatorCell
            cell.titleLabel.text = "How To Get There"
            cell.selectionStyle = .none
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailMapCell.self), for: indexPath) as! RestaurantDetailMapCell
            cell.configure(location: restaurant.location)
            cell.selectionStyle = .none
            return cell
        default:
            fatalError("Failed to instantiate the table view cell for detail view controller")
        }
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showMap"{
            let destinationController = segue.destination as! MapViewController
            destinationController.restaurant = self.restaurant
        }
        else if segue.identifier == "showReview"{
            let destinationController = segue.destination as! ReviewViewController
            destinationController.restaurant = self.restaurant
        }
    }
     // unwind segue
        @IBAction func close(segue : UIStoryboardSegue){
    //        sleep(1)
            dismiss(animated: true, completion: nil)
        }
    //rate action
        @IBAction func rateRestaurant(segue: UIStoryboardSegue){
            if let rating = segue.identifier{
    //            self.restaurant.rating = rating
    //            self.headerView.ratingImageView.image = UIImage(named: rating)
                dismiss(animated: true, completion: {
                    self.restaurant.rating = rating
                    self.headerView.ratingImageView.image = UIImage(named: rating)
                    // start state
                    let scaletransform = CGAffineTransform(scaleX: 0.1, y: 0.1)
                    self.headerView.ratingImageView.transform = scaletransform
                    self.headerView.ratingImageView.alpha = 0
                    //end state
                    UIView.animate(withDuration: 0.4, delay: 0, options: [], animations: {
                        self.headerView.ratingImageView.transform = .identity
                        self.headerView.ratingImageView.alpha = 1.0
                    }, completion: nil)
                })
            }
        }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}
