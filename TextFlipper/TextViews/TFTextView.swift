//
//  TFTextView.swift
//  TextFlipper
//
//  Created by Landon Hughes on 3/24/22.
//

import UIKit

class TFTextView: UITextView {
    
    init(textColor: UIColor) {
        super.init(frame: .zero, textContainer: nil)
        configure(textColor: textColor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(textColor: UIColor) {
        translatesAutoresizingMaskIntoConstraints = false
        font = UIFont.systemFont(ofSize: 17.0)
        layer.borderColor = UIColor.systemBlue.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 5.0
        self.textColor = textColor
        textContainerInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)

    }
}
