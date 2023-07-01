//
//  SearchViewController.swift
//  GitFollowers
//
//  Created by Mahmoud on 27/05/2023.
//

import UIKit

class SearchVC: UIViewController {
    let okButton = GFButton(backgroundColor: .systemGreen, title: "Git Followers")

    let textField = GFTextField(frame: .zero)
    let gitImage = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground

        setButtonConstraint()
        setImageConstraint()
        setTextFiledConstraint()
        createGestureToDissmissKeyboard()
    }
    // MARK: dismiss keyboard method using gesture
    func createGestureToDissmissKeyboard() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    // MARK: add logo image to view
    func setImageConstraint() {
        self.view.addSubview(gitImage)
        gitImage.image = UIImage.icon
        gitImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            gitImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
                      gitImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                      gitImage.heightAnchor.constraint(equalToConstant: 200),
                      gitImage.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    // MARK: add textField to view
    func setTextFiledConstraint() {
        self.view.addSubview(textField)
        textField.delegate = self
        NSLayoutConstraint.activate([
        textField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
        textField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32),
        textField.topAnchor.constraint(equalTo: gitImage.bottomAnchor, constant: 64), textField.heightAnchor.constraint(equalToConstant: 50)

    ])}
    // MARK: add button to veiw
    func setButtonConstraint() {
        self.view.addSubview(okButton)
        okButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        NSLayoutConstraint.activate([
        okButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
        okButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
        okButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
        okButton.heightAnchor.constraint(equalToConstant: 50)
    ])

    }

     // MARK: button action method
     @objc func buttonAction() {
         guard !textField.text!.isEmpty else {
             let customAlert = GFAlertViewController(alerTitle: "OK", message: "Unable to continue the request", buttonTitle: "OK")
             present(customAlert, animated: true)
             return
         }
         let follwerList = FollwerListVC()
         follwerList.username = textField.text
         follwerList.page = 1

         navigationController?.pushViewController(follwerList, animated: true)

     }
}
// MARK: KeyBoard Delegate
extension SearchVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.buttonAction()
        return true
    }
}
