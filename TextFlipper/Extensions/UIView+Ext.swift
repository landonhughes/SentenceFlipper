//
//  UIView+Ext.swift
//  TextFlipper
//
//  Created by Landon Hughes on 3/24/22.
//

import Foundation
import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views {
            self.addSubview(view)
        }
    }
}
