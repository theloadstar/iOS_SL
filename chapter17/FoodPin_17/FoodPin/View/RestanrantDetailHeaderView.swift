//
//  RestanrantDetailHeaderView.swift
//  FoodPin
//
//  Created by Ember on 2021/9/7.
//  Copyright © 2021 Ember. All rights reserved.
//

import UIKit

class RestanrantDetailHeaderView: UIView {

    @IBOutlet var headerImageView : UIImageView!
    @IBOutlet var nameLabel : UILabel!{
        didSet{
            nameLabel.numberOfLines = 0
        }
    }
    @IBOutlet var typeLabel : UILabel!{
        didSet{
            typeLabel.layer.cornerRadius = 5.0
            typeLabel.layer.masksToBounds = true
        }
    }
    @IBOutlet var heartImageView : UIImageView!{
        didSet{
            heartImageView.image = UIImage(named: "heart-tick")?.withRenderingMode(.alwaysTemplate)
            heartImageView.tintColor = .white
        }
        
    }
    
}
