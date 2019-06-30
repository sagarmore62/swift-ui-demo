//
//  MovieRow.swift
//  SwiftUI-Demo
//
//  Created by Sagar More on 29/06/19.
//  Copyright © 2019 Sagar More. All rights reserved.
//

import SwiftUI

// MARK: - Row view for List. Contains Image, title, and vote
struct MovieRow : View {
    let data : MovieObjectViewModel
    var body: some View {
        VStack(alignment: .leading) {
            MovieImage(data: ImageData(data.imagePath))
            
            Text(data.title)
            .font(.headline)
            .multilineTextAlignment(.leading)
            .lineLimit(2)

            Text(data.vote)
            .font(.subheadline)
            .padding(.bottom)
        } 
    }
}

