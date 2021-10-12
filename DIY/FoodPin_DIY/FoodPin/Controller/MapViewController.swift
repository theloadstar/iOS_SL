//
//  MapViewController.swift
//  FoodPin
//
//  Created by Ember on 2021/9/13.
//  Copyright © 2021 Ember. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet var mapView : MKMapView!
    var restaurant : RestaurantMO!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //map customization
        mapView.showsTraffic = true
        mapView.showsScale = true
        mapView.showsCompass = true
        
        mapView.delegate = self
        // Do any additional setup after loading the view.
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(restaurant.location ?? "", completionHandler: {placemarks, error in
            if let error = error{
                print(error.localizedDescription)
                return
            }
            if let placemarks = placemarks{
                let placemark = placemarks[0]
                //add annotation
                let annotation = MKPointAnnotation()
                annotation.title = self.restaurant.name
                annotation.subtitle = self.restaurant.type
                if let location = placemark.location{
                    annotation.coordinate = location.coordinate
                    //display
                    self.mapView.showAnnotations([annotation], animated: true)
                    self.mapView.selectAnnotation(annotation, animated: true)
                }
            }
        })
    }
    
    func mapView(_ mapView: MKMapView,viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "MyMarker"
        //judge whether the location is from the user
        if annotation.isKind(of: MKUserLocation.self){
            return nil
        }
        
        //reuse the annotation if possible
        var annotationView : MKMarkerAnnotationView? = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView
        
        if annotationView == nil{
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        }
        
        annotationView?.glyphText = "🌚"
        annotationView?.glyphTintColor = UIColor.orange
        
        return annotationView
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
