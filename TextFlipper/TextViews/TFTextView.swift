//
//  TFTextView.swift
//  TextFlipper
//
//  Created by Landon Hughes on 3/24/22.
//

import UIKit

class TFTextView: UITextView {
    
    init() {
        super.init(frame: .zero, textContainer: nil)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.font = UIFont.systemFont(ofSize: 17.0)
        self.layer.borderColor = UIColor.systemBlue.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 5.0
    }
}
