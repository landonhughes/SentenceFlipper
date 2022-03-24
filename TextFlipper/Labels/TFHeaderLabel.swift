//
//  TFLabel.swift
//  TextFlipper
//
//  Created by Landon Hughes on 3/24/22.
//

import UIKit

class TFHeaderLabel: UILabel {

    init(text: String, alignment: NSTextAlignment) {
        super.init(frame: .zero)
        self.text = text
        configure(textAlignment: alignment)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(textAlignment: NSTextAlignment) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.font = UIFont.preferredFont(forTextStyle: .headline)
        self.textAlignment = textAlignment
        self.textColor = .label
    }
}
