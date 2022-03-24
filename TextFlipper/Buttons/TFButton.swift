//
//  TFButton.swift
//  TextFlipper
//
//  Created by Landon Hughes on 3/24/22.
//

import UIKit

class TFButton: UIButton {

    init(title: String) {
        super.init(frame: .zero)
        configure(title: title)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(title: String) {
        translatesAutoresizingMaskIntoConstraints = false
        configuration = .tinted()
        configuration?.baseBackgroundColor = .systemBlue
        configuration?.baseForegroundColor = .systemBlue
        configuration?.title = title
        
    }
}
