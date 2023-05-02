//
//  CellectionCell.swift
//  SimpleCollectionView
//
//  Created by Timothy Brandt on 5/1/23.
//

import Foundation
import UIKit

class CollectionCell: UICollectionViewCell {
    static var identifier = "CollectionCell"
    
    lazy var mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    
    lazy var imageView: DownloadableImageView = {
        let imageView = DownloadableImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func download(urlString: String) {
        if let url = URL(string: urlString) {
            imageView.download(url: url)
        }
    }
    
    private func setupViews() {
        self.addSubview(mainView)
        
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: mainView.topAnchor),
            self.leftAnchor.constraint(equalTo: mainView.leftAnchor),
            self.rightAnchor.constraint(equalTo: mainView.rightAnchor),
            self.bottomAnchor.constraint(equalTo: mainView.bottomAnchor)
        ])
        
        mainView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: imageView.topAnchor),
            mainView.leftAnchor.constraint(equalTo: imageView.leftAnchor),
            mainView.rightAnchor.constraint(equalTo: imageView.rightAnchor),
            mainView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor)
        ])
    }
}
