//
//  GFContainView.swift
//  GitFollowers
//
//  Created by Mahmoud on 13/06/2023.
//

import UIKit
final class GFContainView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        config()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func config() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBackground
        layer.cornerRadius = 16
        layer.borderWidth = 3
        layer.borderColor = UIColor.white.cgColor
    }
}
