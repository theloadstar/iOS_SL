//
//  MapViewController.swift
//  FoodPin
//
//  Created by Ember on 2021/9/13.
//  Copyright © 2021 Ember. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    @IBOutlet var mapView : MKMapView!
    var restaurant = Restaurant()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(restaurant.location, completionHandler: {placemarks, error in
            if let error = error{
                print(error.localizedDescription)
                return
            }
            if let placemarks = placemarks{
                let placemark = placemarks[0]
                //add annotation
                let annotation = MKPointAnnotation()
                if let location = placemark.location{
                    annotation.coordinate = location.coordinate
                    //display
                    self.mapView.showAnnotations([annotation], animated: true)
//                    self.mapView.selectAnnotation(annotation, animated: true)
                }
            }
        })
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
