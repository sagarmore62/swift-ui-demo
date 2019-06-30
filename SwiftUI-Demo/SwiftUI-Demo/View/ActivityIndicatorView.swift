//
//  ActivityIndicatorView.swift
//  SwiftUI-Demo
//
//  Created by Sagar More on 29/06/19.
//  Copyright © 2019 Sagar More. All rights reserved.
//

import UIKit
import SwiftUI

struct ActivityIndicatorView : UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: .large)
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        uiView.hidesWhenStopped = true
        uiView.color = .black
        uiView.startAnimating()
    }
    
    
}
