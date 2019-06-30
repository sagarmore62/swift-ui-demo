//
//  MovieRepository.swift
//  SwiftUI-Demo
//
//  Created by Sagar More on 29/06/19.
//  Copyright © 2019 Sagar More. All rights reserved.
//

import Foundation

/// Repository to feed data for movie model
struct MovieRepository {
    private let endPoint = EndPoint.popularMovies
    
    /// gets popular movies from server
    func getMovies( completionHandler : @escaping (Data?, Error?) -> Void) {
        NetworkService.startRequest(endPoint, httpMethod: .get) { (data, err) in
            completionHandler(data, err)
        }
    }
}
