//
//  DownloadableImageView.swift
//  SimpleCollectionView
//
//  Created by Timothy Brandt on 5/1/23.
//

import Foundation
import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

class DownloadableImageView: UIImageView {
    func download(url: URL) {
        if let image = imageCache.object(forKey: url as AnyObject) as? UIImage {
            DispatchQueue.main.async {
                self.image = image
            }
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                return
            }
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = image
                }
                imageCache.setObject(image, forKey: url as AnyObject)
            }
        }.resume()
    }
}
