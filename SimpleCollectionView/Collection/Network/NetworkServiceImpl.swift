//
//  NetworkServiceImpl.swift
//  SimpleCollectionView
//
//  Created by Timothy Brandt on 5/2/23.
//

import Foundation

enum ListingError: Error {
    case genericError(Error)
    case decodingError(Error)
}

class NetworkServiceImpl: NetworkService {
    static var PostsURL = URL(string: "https://www.reddit.com/r/aww.json")!
    
    func getPosts(completion: @escaping (Result<Listing, ListingError>) -> Void) {
        URLSession.shared.dataTask(with: NetworkServiceImpl.PostsURL) { data, response, error in
            if let error = error {
                completion(.failure(.genericError(error)))
            }
            
            if let data = data {
                do {
                    let listing = try JSONDecoder().decode(Listing.self, from: data)
                    completion(.success(listing))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
            
        }.resume()
    }
}
