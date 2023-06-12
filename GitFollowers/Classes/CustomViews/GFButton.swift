//
//  GFButton.swift
//  GitFollowers
//
//  Created by Mahmoud on 27/05/2023.
//

import UIKit

final class GFButton: UIButton {
    init(backgroundColor: UIColor, title: String) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        setConfig()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConfig()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setConfig() {
//        backgroundColor = UIColor.black
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        titleLabel?.textColor = .white
    }

}
