//
//  CollectionBuilder.swift
//  SimpleCollectionView
//
//  Created by Timothy Brandt on 5/1/23.
//

import Foundation
import UIKit

class CollectionBuilder {
    static func build() -> UIViewController {
        let network = NetworkServiceImpl()
        let interactor = CollectionInteractorImpl(network: network)
        let presenter = CollectionPresenterImpl(interactor: interactor)
        interactor.setOutput(presenter)
        let vc = CollectionVC(presenter: presenter)
        presenter.setOutput(vc)
        return vc
    }
}
