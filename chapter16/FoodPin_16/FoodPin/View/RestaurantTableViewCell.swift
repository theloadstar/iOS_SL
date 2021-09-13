//
//  RestaurantTableViewCell.swift
//  FoodPin
//
//  Created by Ember on 2021/8/31.
//  Copyright © 2021 Ember. All rights reserved.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {
    @IBOutlet var nameLabel : UILabel!
    @IBOutlet var locationLabel : UILabel!{
        didSet{
            locationLabel.numberOfLines = 0;
//            print(locationLabel.font!.fontName)
        }
    }
    @IBOutlet var typeLabel : UILabel!
    @IBOutlet var thumbnailImageView : UIImageView!{
        didSet{
            thumbnailImageView.layer.cornerRadius = thumbnailImageView.layer.bounds.width/2.7;
            //裁剪超出父视图的部分，这里可以不用，因为不会超出
            thumbnailImageView.clipsToBounds = true;
        }
    }
    @IBOutlet var HeartImageView : UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
