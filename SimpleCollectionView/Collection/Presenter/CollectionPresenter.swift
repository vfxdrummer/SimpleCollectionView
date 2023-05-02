//
//  CollectionPresenter.swift
//  SimpleCollectionView
//
//  Created by Timothy Brandt on 5/1/23.
//

import Foundation

protocol CollectionPresenter {
    var interactor: CollectionInteractor { get }
    var output: CollectionPresenterOutput? { set get }
    var itemSize: CGSize { get }
    var numberOfItemsInSection: Int { get }
    
    func setOutput(_ output: CollectionPresenterOutput)
    func viewWillAppear()
    func configureCell(_ cell: CollectionCell, forItemAt: IndexPath)
}

protocol CollectionPresenterOutput {
    func reload()
}
