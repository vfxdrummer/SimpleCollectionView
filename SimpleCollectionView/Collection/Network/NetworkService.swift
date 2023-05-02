//
//  NetworkService.swift
//  SimpleCollectionView
//
//  Created by Timothy Brandt on 5/1/23.
//

import Foundation

protocol NetworkService {
    func getPosts(completion: @escaping (Result<Listing, ListingError>) -> Void)
}
