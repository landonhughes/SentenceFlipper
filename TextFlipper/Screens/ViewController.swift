//
//  ViewController.swift
//  TextFlipper
//
//  Created by Landon Hughes on 3/24/22.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {

    private let buttonHeight: CGFloat = 40
    private let labelHeight: CGFloat = 30
    private let headerLabel = TFHeaderLabel(text: "Text Flipper", alignment: .center)
    private let inputTextView = TFTextView(textColor: .white)
    private let doneTypingButton = TFButton(title: "Done Typing")
    private let outputTextView = TFTextView(textColor: .systemGray)
    private let generateButton = TFButton(title: "Generate")
    
    
    private let inset: CGFloat = 15
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHeaderLabel()
        configureInputTextView()
        configureDoneTypingButton()
        configureGenerateButton()
        configureOutputTextView()
        
        doneTypingButton.addTarget(self, action: #selector(endEditing), for: .touchUpInside)
        doneTypingButton.addTarget(self, action: #selector(startEditing), for: .touchUpInside)
        generateButton.addTarget(self, action: #selector(generateUpsideDownText), for: .touchUpInside)
    }

    @objc func endEditing() {
        inputTextView.isEditable = false
    }
    @objc func startEditing() {
        inputTextView.isEditable = true
    }
    
    @objc func generateUpsideDownText() {
        let flippedWords = TextFlipper.invertText(sentence: inputTextView.text)
        outputTextView.text = flippedWords
    }
    
    private func configureHeaderLabel() {
        view.addSubview(headerLabel)
        
        NSLayoutConstraint.activate([
            headerLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            headerLabel.heightAnchor.constraint(equalToConstant: labelHeight)
        ])
    }
    
    private func configureInputTextView() {
        view.addSubview(inputTextView)
        
        inputTextView.delegate = self

        NSLayoutConstraint.activate([
            inputTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: inset),
            inputTextView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor),
            inputTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -inset),
            inputTextView.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -buttonHeight)
        ])
    }
    
    private func configureDoneTypingButton() {
        view.addSubview(doneTypingButton)
        
        NSLayoutConstraint.activate([
            doneTypingButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: inset),
            doneTypingButton.topAnchor.constraint(equalTo: inputTextView.bottomAnchor, constant: inset),
            doneTypingButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -inset),
            doneTypingButton.heightAnchor.constraint(equalToConstant: buttonHeight)
        ])
    }

    private func configureOutputTextView() {
        view.addSubview(outputTextView)
        outputTextView.isEditable = false
        
        NSLayoutConstraint.activate([
            outputTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: inset),
            outputTextView.topAnchor.constraint(equalTo: doneTypingButton.bottomAnchor, constant: inset),
            outputTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -inset),
            outputTextView.bottomAnchor.constraint(equalTo: generateButton.topAnchor, constant: -inset)
        ])
    }
    
    private func configureGenerateButton() {
        view.addSubview(generateButton)
        
        NSLayoutConstraint.activate([
            generateButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: inset),
            generateButton.heightAnchor.constraint(equalToConstant: buttonHeight),
            generateButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -inset),
            generateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -inset)
        ])
    }

}
