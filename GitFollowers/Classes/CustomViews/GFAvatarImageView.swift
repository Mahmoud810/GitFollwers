//
//  GFAvatarImageView.swift
//  GitFollowers
//
//  Created by Mahmoud on 15/06/2023.
//

import UIKit

class GFAvatarImageView: UIImageView {
    private let avaterPlaceHolder = UIImage.avatar
    let cache = Network.shared.cache

    override init(frame: CGRect) {
        super.init(frame: frame)
        config()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func config() {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = avaterPlaceHolder
        translatesAutoresizingMaskIntoConstraints = false
    }
    func downloadImage(from stringURL: String) {
        let cacheKey = NSString(string: stringURL)

        if let image = cache.object(forKey: cacheKey) {
            self.image = image
            return
        }

        guard let url = URL(string: stringURL)else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { [weak self]data, _, _ in
            guard let self = self else {return}
            guard let data = data else {return}

            guard let image = UIImage(data: data)else {return}
            self.cache.setObject(image, forKey: cacheKey)

            DispatchQueue.main.async {
                self.image = image
            }

        }
        task.resume()
    }

}
