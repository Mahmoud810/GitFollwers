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
     init() {
    }
    func getFollowers(for username: String, page: Int) async throws -> Result<Followers, ErrorType> {

        return try await withCheckedThrowingContinuation { continuation in
            let endPoint = self.baseUrl + "\(username)/followers?per_page=100&page=\(page)"
            guard let url = URL(string: endPoint)else {

                continuation.resume(returning: .failure(.invalidUsername))
                return
            }
            let task = URLSession.shared.dataTask(with: url, completionHandler: { data, response, _ in

                guard let data = data else {
                    continuation.resume(returning: .failure(.invalidData))
                    return
                }
                guard let response = response else {
                    continuation.resume(returning: .failure(.invalidResponse))
                    return
                }
                do {
                    let followers = try JSONDecoder().decode(Followers.self, from: data)
                    continuation.resume(returning: .success(followers))
                    return
                } catch {
                    continuation.resume(returning: .failure(.unableToComplete))
                    return
                }

            }).resume()

        }
    }
}
