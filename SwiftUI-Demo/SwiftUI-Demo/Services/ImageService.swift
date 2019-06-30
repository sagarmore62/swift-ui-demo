//
//  ImageService.swift
//  SwiftUI-Demo
//
//  Created by Sagar More on 29/06/19.
//  Copyright © 2019 Sagar More. All rights reserved.
//

import UIKit
let imageCache = NSCache<AnyObject, AnyObject>()

class ImageService: NSObject {
    
    /// Method get download image from server with url, with help of caching mechanism
    /// - Parameter urlString: image url in string format
    class func getImageWith(_ urlString : String, completionHandler : @escaping(UIImage?) -> Void) {
        guard let url = URL(string: urlString) else {
            completionHandler(nil)
            return
        }
        
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
           completionHandler(imageFromCache)
            return
        }
        
        URLSession.shared.dataTask(with: url) {
            data, response, error in
            if let response = data {
                DispatchQueue.main.async {
                    guard let imageToCache = UIImage(data: response) else {
                        completionHandler(nil)
                        return
                    }
                    imageCache.setObject(imageToCache, forKey: urlString as AnyObject)
                    completionHandler(imageToCache)
                }
            }
            }.resume()
    }
}
