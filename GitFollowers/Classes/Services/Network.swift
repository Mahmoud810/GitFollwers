//
//  Network.swift
//  GitFollowers
//
//  Created by Mahmoud on 31/05/2023.
//

import UIKit
final class Network {
    static let shared = Network()
       private let baseUrl = "http://api.github.com/users/"
       let cache = NSCache<NSString, UIImage>()
    private init() {
    }
    func getFollowers(for username: String, page: Int, completion: @escaping(Result<Users, Error>) -> Void) {
        let endPoint = baseUrl + "\(username)/followers?per_page=100&page=\(page)"

        guard let url = URL(string: endPoint) else{
            completion(.failure())
            return
        }
    }

}
