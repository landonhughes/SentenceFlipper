//
//  String+Ext.swift
//  TextFlipper
//
//  Created by Landon Hughes on 3/24/22.
//

import Foundation

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}
