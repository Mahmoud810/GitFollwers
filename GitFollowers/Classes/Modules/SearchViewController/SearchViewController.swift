//
//  SearchViewController.swift
//  GitFollowers
//
//  Created by Mahmoud on 27/05/2023.
//

import UIKit

class SearchViewController: UIViewController, UITextFieldDelegate {
    let testButton = GFButton(backgroundColor: .systemGreen, title: "test")

    let textField = GFTextField(frame: .zero)
    let gitImage = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(testButton)
        self.view.addSubview(gitImage)
        self.view.addSubview(textField)

        setButtonConstraint()
        setImageConstraint()
        setTextFiledConstraint()
    }
    func setImageConstraint() {

        gitImage.image = UIImage.icon
        gitImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            gitImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
                      gitImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                      gitImage.heightAnchor.constraint(equalToConstant: 200),
                      gitImage.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    func setTextFiledConstraint() {
        textField.delegate = self
        NSLayoutConstraint.activate([
        textField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
        textField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32),
        textField.topAnchor.constraint(equalTo: gitImage.bottomAnchor, constant: 64), textField.heightAnchor.constraint(equalToConstant: 50)

    ])}
    func setButtonConstraint() {NSLayoutConstraint.activate([
        testButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
        testButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
        testButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
        testButton.heightAnchor.constraint(equalToConstant: 50)
    ])}

}
