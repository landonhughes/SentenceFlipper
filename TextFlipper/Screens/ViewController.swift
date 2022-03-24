//
//  ViewController.swift
//  TextFlipper
//
//  Created by Landon Hughes on 3/24/22.
//

import UIKit

class ViewController: UIViewController {

    private let inputTextView = TFTextView()
    private let headerLabel = TFHeaderLabel(text: "Text Flipper", alignment: .center)
    private let outputLabel = TFHeaderLabel(text: "Output", alignment: .center)
    private let outputTextView = TFTextView()
    private let generateButton = TFButton()
    
    
    private let inset: CGFloat = 15
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHeaderLabel()
        configureInputTextView()
        configureOutputLabel()
        configureGenerateButton()
        configureOutputTextView()
        
        
        let textFlipper = TextFlipper()
        let multilineSentence =
        """
        This is an actual paragraph. I'm trying to flip.
        I love android phones hahaha

        """
        textFlipper.invertText(sentence: multilineSentence)
    }

    func configureHeaderLabel() {
        view.addSubview(headerLabel)
        
        NSLayoutConstraint.activate([
            headerLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            headerLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func configureInputTextView() {
        view.addSubview(inputTextView)
        
        inputTextView.delegate = self

        NSLayoutConstraint.activate([
            inputTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: inset),
            inputTextView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor),
            inputTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -inset),
            inputTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        ])
    }
    
    func configureOutputLabel() {
        view.addSubview(outputLabel)
        
        NSLayoutConstraint.activate([
            outputLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            outputLabel.topAnchor.constraint(equalTo: inputTextView.bottomAnchor),
            outputLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            outputLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
    }
    
    func configureOutputTextView() {
        view.addSubview(outputTextView)
        outputTextView.isEditable = false
        
        NSLayoutConstraint.activate([
            outputTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: inset),
            outputTextView.topAnchor.constraint(equalTo: outputLabel.bottomAnchor),
            outputTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -inset),
            outputTextView.bottomAnchor.constraint(equalTo: generateButton.topAnchor, constant: -inset)
        ])
    }
    
    func configureGenerateButton() {
        view.addSubview(generateButton)
        
        NSLayoutConstraint.activate([
            generateButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: inset),
            generateButton.heightAnchor.constraint(equalToConstant: 40),
            generateButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -inset),
            generateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -inset)
        ])
    }
    
}

extension ViewController: UITextViewDelegate {
    
}
