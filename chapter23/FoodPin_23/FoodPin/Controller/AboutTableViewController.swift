//
//  AboutTableViewController.swift
//  FoodPin
//
//  Created by Ember on 2021/9/28.
//  Copyright © 2021 Ember. All rights reserved.
//

import UIKit
import SafariServices

class AboutTableViewController: UITableViewController {
    
    var sectionTitles = ["FeedBack", "Folllow us"]
    
    var sectionContent = [[(image:"store", text:"Rate us on App Store", link: "https://www.apple.com/ios/appstore"), (image:"chat", text:"Tell us your feedback", link: "https://www.appcoda.com/contact")],[(image:"twitter", text:"Twitter", link:"https://www.baidu.com"), (image:"facebook", text:"Facebook", link:"https://facebook.com/appcodamobile"), (image:"instagram", text:"Instagram", link:"https://www.instagram.com/appcodadotcom")]]

    override func viewDidLoad() {
        super.viewDidLoad()

        //for iPad readable
        tableView.cellLayoutMarginsFollowReadableWidth = true
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        if let customFont = UIFont(name: "Rubik-Medium", size: 40.0){
            navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor(231, 76, 60), NSAttributedString.Key.font: customFont]
        }
        //hide the blank cells
        tableView.tableFooterView = UIView()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sectionContent.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sectionContent[section].count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AboutCell", for: indexPath)

        // Configure the cell...
        let cellData = sectionContent[indexPath.section][indexPath.row]
        cell.textLabel?.text = cellData.text
        cell.imageView?.image = UIImage(named: cellData.image)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let link = sectionContent[indexPath.section][indexPath.row].link
        switch indexPath.section{
        case 0:
            //rate us on app store
            if indexPath.row == 0{
                if let url = URL(string: link){
                    UIApplication.shared.open(url)
                }
            }
            //feedback
            else if indexPath.row == 1{
                performSegue(withIdentifier: "showWebView", sender: self)
            }
        // follow, here my vpn overdues, so replace with other website
        case 1:
            if let url = URL(string: link){
                let safariController = SFSafariViewController(url: url)
                present(safariController, animated: true, completion: nil)
            }
        default:
            break
        }
        tableView.deselectRow(at: indexPath, animated: true)
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showWebView"{
            if let destinationController = segue.destination as? WebViewController, let indexPath = tableView.indexPathForSelectedRow{
                    destinationController.targetURL = sectionContent[indexPath.section][indexPath.row].link
            }
        }
    }
    

}
