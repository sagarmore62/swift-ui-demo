//
//  MovieViewModel.swift
//  SwiftUI-Demo
//
//  Created by Sagar More on 29/06/19.
//  Copyright © 2019 Sagar More. All rights reserved.
//

import Combine
import SwiftUI

// A type that publishes an event when the object has changed.
final class MovieViewModel : BindableObject {
    private let repo : MovieRepository
    let didChange = PassthroughSubject<MovieViewModel, Never> ()
    var list = [MovieObjectViewModel]() {
        didSet {
            DispatchQueue.main.async {
                //publish from main thread
                self.didChange.send(self)
            }
        }
    }
    var isLoading = false {
        didSet {
            DispatchQueue.main.async {
                self.didChange.send(self)
            }
        }
    }
    
    init() {
        repo = MovieRepository()
        getMovies()
    }
    
    private func getMovies() {
        isLoading = true
        repo.getMovies( completionHandler: { [weak self] (data, err) in
            self?.isLoading = false
            if let newData = data {
                newData.getJsonModel(modelType: MovieList.self, decodingStrategy:JSONDecoder.KeyDecodingStrategy.useDefaultKeys , completionHandler: { (model, error) in
                    if let unwrapped = model {
                        self?.transform(unwrapped)
                    }
                })
            } else {
                print(err?.localizedDescription)
            }
        })
    }
    
    ///transforms model into view model
    private func transform(_ model : MovieList) {
        let arr = model.results.map({ MovieObjectViewModel($0)})
        self.list.append(contentsOf:arr)
    }
}

struct MovieObjectViewModel : Identifiable {
    var id: String {
        return title //considered title is unique
    }
    
    let imagePath : String
    let title : String
    let vote : String
    
    //Created dependency injection for view model
    init(_ model : MovieObject) {
        title = model.title
        //format full image path
        imagePath = Constants.domainImage + "w300" + model.poster_path
        //converts to rating
        let rating = Int(model.vote_average)
        let ratingText = (0..<rating).reduce("") { (acc, _) -> String in
            return acc + "⭐️"
        }
        vote = ratingText
    }
    
}
