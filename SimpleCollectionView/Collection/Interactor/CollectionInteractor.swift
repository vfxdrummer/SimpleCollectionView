//
//  Interactor.swift
//  SimpleCollectionView
//
//  Created by Timothy Brandt on 5/1/23.
//

import Foundation

protocol CollectionInteractor {
    var network: NetworkService { get }
    var output: CollectionInteractorOutput? { get set }
    func setOutput(_ output: CollectionInteractorOutput)
    func fetchData()
}

protocol CollectionInteractorOutput {
    func updatePosts(_ posts: [Post])
}
