//
//  FollwersCell.swift
//  GitFollowers
//
//  Created by Mahmoud on 14/06/2023.
//

import UIKit

class FollowersCell: UICollectionViewCell {
    static let reuseID = "follwerCell"
    let usernameLabel = GFTitleLabel(textAlignment: .center, fontSize: 16)
    let avaterImageView = GFAvatarImageView(frame: .zero)

    override init(frame: CGRect) {
        super.init(frame: frame)
        config()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func set(follwer: Users) {
        usernameLabel.text = follwer.login
        avaterImageView.downloadImage(from: follwer.avatarURL)
    }
    func config() {
        addSubview(avaterImageView)
        addSubview(usernameLabel)

        let padding: CGFloat = 8

        NSLayoutConstraint.activate([
            avaterImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            avaterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            avaterImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            avaterImageView.widthAnchor.constraint(equalToConstant: 100),
            avaterImageView.heightAnchor.constraint(equalTo: avaterImageView.widthAnchor),

            usernameLabel.topAnchor.constraint(equalTo: avaterImageView.bottomAnchor, constant: 12),
            usernameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            usernameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            usernameLabel.heightAnchor.constraint(equalToConstant: 20)

        ])
    }

}
