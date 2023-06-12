//
//  GFLabel.swift
//  GitFollowers
//
//  Created by Mahmoud on 27/05/2023.
//

import UIKit

final class GFLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConfig()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    init(textAlignment: NSTextAlignment, fontSize: CGFloat) {
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        setConfig()

    }
    private func setConfig() {
        translatesAutoresizingMaskIntoConstraints = false
        textColor = .label
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
        lineBreakMode = .byTruncatingTail
    }
}
