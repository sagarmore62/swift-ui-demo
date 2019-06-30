//
//  MovieImage.swift
//  SwiftUI-Demo
//
//  Created by Sagar More on 29/06/19.
//  Copyright © 2019 Sagar More. All rights reserved.
//

import SwiftUI

// MARK: - Custom Image view for Row
struct MovieImage : View {
    @State var data : ImageData
    
    var body: some View {
        VStack {
            if data.image != nil { //set image after download
                Image.init(uiImage: data.image!)
                    .resizable()
                    .frame(width: UIScreen.main.bounds.size.width - 32, height: 300)
                    .cornerRadius(5)
                    .shadow(radius: 8)
                    .aspectRatio(contentMode: .fit)
            }
            else { //set placeholder for image
                Rectangle()
                    .foregroundColor(.gray)
                    .frame(width: UIScreen.main.bounds.size.width - 32, height: 300)
                    .cornerRadius(5)
                    .shadow(radius: 8)
            }
        }
            .onAppear {
                self.data.downloadImage()
        }
    }
}

