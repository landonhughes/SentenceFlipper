//
//  ViewController.swift
//  TextFlipper
//
//  Created by Landon Hughes on 3/24/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let textFlipper = TextFlipper()
        let multilineSentence =
        """
        This is an actual paragraph. I'm trying to flip.
        I love android phones hahaha

        """
        textFlipper.invertText(sentence: multilineSentence)
    }

}

