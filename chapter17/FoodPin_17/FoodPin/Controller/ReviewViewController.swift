//
//  ReviewViewController.swift
//  FoodPin
//
//  Created by Ember on 2021/9/14.
//  Copyright © 2021 Ember. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    
    @IBOutlet var backgroundImageView : UIImageView!
    @IBOutlet var ratebuttons : [UIButton]!
    
    var restaurant = Restaurant()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundImageView.image = UIImage(named: restaurant.image)
        // Do any additional setup after loading the view.
        //blur effect
        let blureffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blureffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        //move beyond the trailing
        let moveRightTransform = CGAffineTransform(translationX: 600, y: 0)
        let scaleUpTransform = CGAffineTransform(scaleX: 5.0, y: 5.0)
        let moveScaleTransform = scaleUpTransform.concatenating(moveRightTransform)
        //fade-in animation
        for button in ratebuttons{
            button.alpha = 0
            button.transform = moveScaleTransform
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        UIView.animate(withDuration: 2.0){
//            for button in self.ratebuttons{
//                button.alpha = 1.0
//            }
//        }
        for i in 0...self.ratebuttons.count-1 {
            UIView.animate(withDuration: 0.4, delay: 0.1+Double(i)*0.05, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: [], animations: {
                self.ratebuttons[i].alpha = 1.0
                self.ratebuttons[i].transform = .identity
            }, completion: nil)
        }
    }
    
    //DIY
//    override func viewWillDisappear(_ animated: Bool) {
//        //move beyond the trailing
//        let moveRightTransform = CGAffineTransform(translationX: 600, y: 0)
//        let scaleUpTransform = CGAffineTransform(scaleX: 5.0, y: 5.0)
//        let moveScaleTransform = scaleUpTransform.concatenating(moveRightTransform)
//        //fade-in animation
//        for button in ratebuttons{
//            button.alpha = 0
//            button.transform = moveScaleTransform
//        }
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
