//
//  UINavigationController+Ext.swift
//  FoodPin
//
//  Created by Ember on 2021/9/10.
//  Copyright © 2021 Ember. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController{
    open override var childForStatusBarStyle: UIViewController?{
        return topViewController
    }
}
