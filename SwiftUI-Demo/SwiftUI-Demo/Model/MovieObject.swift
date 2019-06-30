//
//  MovieObject.swift
//  SwiftUI-Demo
//
//  Created by Sagar More on 29/06/19.
//  Copyright © 2019 Sagar More. All rights reserved.
//

import Foundation

struct MovieObject : Decodable  {
    let title           : String
    let poster_path     : String
    let vote_average    : Float
}
