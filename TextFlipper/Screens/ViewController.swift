//
//  ViewController.swift
//  TextFlipper
//
//  Created by Landon Hughes on 3/24/22.
//

import UIKit

class ViewController: UIViewController {

    private let buttonHeight: CGFloat = 40
    private let labelHeight: CGFloat = 30
    private let inset: CGFloat = 15
    
    private let headerLabel = TFHeaderLabel(text: "Text Flipper", alignment: .center)
    private let inputTextView = TFTextView(textColor: .systemBlue)
    private let doneTypingButton = TFButton(title: "Done Typing")
    private let outputTextView: TFTextView = {
        let textView = TFTextView(textColor: .systemGray)
        textView.isEditable = false
        return textView
    }()
    private let generateButton = TFButton(title: "Generate")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubviews(headerLabel, inputTextView, doneTypingButton, outputTextView, generateButton)
        layoutUI()
        addDoneButtonToKeyboard()

        doneTypingButton.addTarget(self, action: #selector(endEditing), for: .touchUpInside)
        doneTypingButton.addTarget(self, action: #selector(startEditing), for: .touchUpInside)
        generateButton.addTarget(self, action: #selector(displayUpsideDownText), for: .touchUpInside)
    }
    
    private func addDoneButtonToKeyboard() {
        //credit to https://stevenpcurtis.medium.com/enabling-the-done-button-to-a-uitextview-967499f392ed
        let toolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0,  width: self.view.frame.size.width, height: 30))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneBtn: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneTapped))
        toolbar.setItems([flexSpace, doneBtn], animated: false)
        toolbar.sizeToFit()
        inputTextView.inputAccessoryView = toolbar
    }

    @objc func endEditing() {
        inputTextView.isEditable = false
    }
    @objc func startEditing() {
        inputTextView.isEditable = true
    }
    
    @objc func doneTapped() {
        view.endEditing(true)
    }
    
    @objc func displayUpsideDownText() {
        let flippedWords = TextFlipper.invertText(sentence: inputTextView.text)
        outputTextView.text = flippedWords
    }

    private func layoutUI() {
        
        //headerLabel
        NSLayoutConstraint.activate([
            headerLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            headerLabel.heightAnchor.constraint(equalToConstant: labelHeight)
        ])
        
        //input text view
        NSLayoutConstraint.activate([
            inputTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: inset),
            inputTextView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor),
            inputTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -inset),
            inputTextView.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -buttonHeight)
        ])
        
        //done typing button
        NSLayoutConstraint.activate([
            doneTypingButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: inset),
            doneTypingButton.topAnchor.constraint(equalTo: inputTextView.bottomAnchor, constant: inset),
            doneTypingButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -inset),
            doneTypingButton.heightAnchor.constraint(equalToConstant: buttonHeight)
        ])
        
        //generate button
        NSLayoutConstraint.activate([
            generateButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: inset),
            generateButton.heightAnchor.constraint(equalToConstant: buttonHeight),
            generateButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -inset),
            generateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -inset)
        ])
        
        //output text view
        NSLayoutConstraint.activate([
            outputTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: inset),
            outputTextView.topAnchor.constraint(equalTo: doneTypingButton.bottomAnchor, constant: inset),
            outputTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -inset),
            outputTextView.bottomAnchor.constraint(equalTo: generateButton.topAnchor, constant: -inset)
        ])

    }
}
