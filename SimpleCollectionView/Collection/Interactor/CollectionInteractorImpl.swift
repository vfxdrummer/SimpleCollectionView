//
//  InteractorImpl.swift
//  SimpleCollectionView
//
//  Created by Timothy Brandt on 5/1/23.
//

import Foundation

class CollectionInteractorImpl: CollectionInteractor {
    var network: NetworkService
    var output: CollectionInteractorOutput?
    
    init(network: NetworkService) {
        self.network = network
    }
    
    func setOutput(_ output: CollectionInteractorOutput) {
        self.output = output
    }
    
    func fetchData() {
        network.getPosts() { [weak self] result in
            guard let self = self else { return }
            switch(result) {
                case .failure(let error):
                    print(">>> error : \(error)")
                case .success(let listing):
                    print(">>> listing : \(listing.data.children)")
                let posts = listing.data.children.map {
                    $0.data
                }
                self.output?.updatePosts(posts)
            }
        }
    }
}
