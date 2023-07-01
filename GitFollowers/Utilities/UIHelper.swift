//
//  UIHelper.swift
//  GitFollowers
//
//  Created by Mahmoud on 15/06/2023.
//

import UIKit

struct UIHelper {
    static func createThreeColumnFlowLayout(to view: UIView) -> UICollectionViewFlowLayout {
        let width = view.bounds.width
        let padding: CGFloat = 12
        let miniumItemSpacing: CGFloat = 10
        let availableWidth = width - (padding * 2) - (miniumItemSpacing*2)
        let itemWidth = availableWidth / 3

        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
        return flowLayout

    }
}
