//
//  GFAlertViewController.swift
//  GitFollowers
//
//  Created by Mahmoud on 13/06/2023.
//

import Foundation
import UIKit
final class GFAlertViewController: UIViewController {

    let containerView = GFContainView()
    let titleLabel = GFTitleLabel(textAlignment: .center, fontSize: 16)
    let messageLabel = GFBodyLabel(textAlignment: .center)
    let actionButton = GFButton(backgroundColor: .systemPink, title: "OK")

    var alertTitle: String?
    var message: String?
    var buttonTitle: String?

    let padding: CGFloat = 20

    init(alerTitle: String, message: String, buttonTitle: String) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle = alerTitle
        self.message = message
        self.buttonTitle = buttonTitle
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configContainerView()
        configTitleLabel()
        configActionButton()
        configMessageLabel()

    }
    // MARK: add constraint to container inside view
    func configContainerView() {
        self.view.addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 280),
            containerView.heightAnchor.constraint(equalToConstant: 220)
        ])
    }
    // MARK: add constraint to title label inside container
    func configTitleLabel() {
        containerView.addSubview(titleLabel)
        titleLabel.text = alertTitle ?? "something went wrong"

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 28 )
        ])
    }
    // MARK: add constraint to message label inside container
    func configMessageLabel() {
        containerView.addSubview(messageLabel)
        messageLabel.text = message ?? "unable to complete request"
        messageLabel.numberOfLines = 4

          NSLayoutConstraint.activate([
              messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
              messageLabel.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -8),
              messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
              messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding)
          ])

    }
    // MARK: add constraint to button inside container
    func configActionButton() {
        containerView.addSubview(actionButton)
        actionButton.setTitle(buttonTitle ?? "OK", for: .normal)
        actionButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        NSLayoutConstraint.activate([
                   actionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding),
                   actionButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
                   actionButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
                   actionButton.heightAnchor.constraint(equalToConstant: 44)
               ])

    }
    // MARK: dismiss method
    @objc func dismissVC() {
        dismiss(animated: true)
    }
}
