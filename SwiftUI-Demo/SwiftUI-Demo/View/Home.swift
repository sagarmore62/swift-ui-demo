//
//  ContentView.swift
//  SwiftUI-Demo
//
//  Created by Sagar More on 29/06/19.
//  Copyright © 2019 Sagar More. All rights reserved.
//

import SwiftUI

struct Home : View {
    @EnvironmentObject var data : MovieViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                if data.isLoading {
                    ActivityIndicatorView()
                } else {
                    List(data.list.identified(by: \.id)) { row in
                        NavigationButton(destination: MovieDetail(data: row)) {
                            MovieRow(data: row)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("SwiftUI-Demo"))
        }
    }
}

