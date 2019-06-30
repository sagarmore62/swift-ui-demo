//
//  MovieDetail.swift
//  SwiftUI-Demo
//
//  Created by Sagar More on 29/06/19.
//  Copyright © 2019 Sagar More. All rights reserved.
//

import SwiftUI

struct MovieDetail : View {
    let data : MovieObjectViewModel
    var body: some View {
        ZStack (alignment: .top) {
            MovieRow(data: data)
            Spacer()
        }
    }
}

