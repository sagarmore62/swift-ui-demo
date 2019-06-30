//
//  File.swift
//  SwiftUI-Demo
//
//  Created by Sagar More on 29/06/19.
//  Copyright © 2019 Sagar More. All rights reserved.
//

import SwiftUI
import Combine

// MARK: - Bindable Object for Image downloading operation
final class ImageData : BindableObject {
    let didChange = PassthroughSubject<ImageData,Never>()
    private let url : String
    
    init(_ url : String) {
        self.url = url
    }
    
    var image: UIImage? = nil {
        didSet {
            didChange.send(self)
        }
    }
    
    func downloadImage() {
        ImageService.getImageWith(url) { [weak self] (img) in
            self?.image = img
        }
    }
}
