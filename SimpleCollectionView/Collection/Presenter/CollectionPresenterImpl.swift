//
//  CollectionPresenterImpl.swift
//  SimpleCollectionView
//
//  Created by Timothy Brandt on 5/1/23.
//

import Foundation

class CollectionPresenterImpl: CollectionPresenter, CollectionInteractorOutput {
    static var cellWidth = 100.0
    static var cellHeight = 100.0
    
    var posts: [Post] = []
    
    var interactor: CollectionInteractor
    
    var output: CollectionPresenterOutput?
    
    var itemSize = CGSize(width: CollectionPresenterImpl.cellWidth, height: CollectionPresenterImpl.cellHeight)
    
    var numberOfItemsInSection: Int {
        return posts.count
    }
    
    init(interactor: CollectionInteractor) {
        self.interactor = interactor
    }
    
    func setOutput(_ output: CollectionPresenterOutput) {
        self.output = output
    }
    
    func viewWillAppear() {
        interactor.fetchData()
    }
    
    func configureCell(_ cell: CollectionCell, forItemAt: IndexPath) {
        guard (forItemAt.row <= posts.count) else { return }
//        cell.download(urlString: "https://images.pexels.com/photos/45201/kitty-cat-kitten-pet-45201.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")
        cell.download(urlString: posts[forItemAt.row].thumbnail)
    }
    
    // MARK: CollectionInteractorOutput
    
    func updatePosts(_ posts: [Post]) {
        self.posts = posts
        self.output?.reload()
    }
}
