//
//  UIColor+Ext.swift
//  FoodPin
//
//  Created by Ember on 2021/9/10.
//  Copyright © 2021 Ember. All rights reserved.
//

import Foundation
import UIKit

extension UIColor{
    convenience init(_ red : Int, _ green : Int, _ blue : Int){
        let redvalue = CGFloat(red)/255.0
        let greenvalue = CGFloat(green)/255.0
        let bluevalue = CGFloat(blue)/255.0
        self.init(red : redvalue, green : greenvalue, blue : bluevalue, alpha : 1.0)
    }
}
