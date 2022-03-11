//
//  MovieViewModelRepresentable.swift
//  MovieApp
//
//  Created by Aleksandr Bagdasaryan on 10.03.22.
//

import Foundation


protocol MovieViewModelRepresentableType {
    var title: String { get set }
    var dateOfRelease: String { get set }
    var rate: String { get set }
    var imagePath: String { get set }
}

struct MovieViewModelRepresentable: MovieViewModelRepresentableType {
    var title: String
    var dateOfRelease: String
    var rate: String
    var imagePath: String
    
    init(movie: Movie) {
        self.title = movie.title?.capitalized ?? "UNKNOWN"
        self.dateOfRelease = "Release: " + (movie.releaseDate ?? "UNKNOWN").replacingOccurrences(of: "-", with: ".")
        self.rate = "Rate: " +  (movie.voteAverage != nil ? String(movie.voteAverage!) : "UNKNOWN")
        self.imagePath = "https://image.tmdb.org/t/p/original" + (movie.backdropPath ?? "")
    }
}
