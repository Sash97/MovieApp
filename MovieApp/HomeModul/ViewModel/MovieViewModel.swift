//
//  MovieViewModel.swift
//  MovieApp
//
//  Created by Aleksandr Bagdasaryan on 10.03.22.
//

import Foundation


protocol MovieViewModelType: AnyObject {
    func getMoviesCount() -> Int
    func getMovies()
    func getMovie(by indexPath: IndexPath) -> MovieViewModelRepresentableType
    func getMoreMovies()
    var reloadData: (() -> ())? { get set }
    var errorMessageCallback: ((Error) -> ())? { get set }
}


final class MovieViewModel: MovieViewModelType {
    //MARK: - Properties -
    
    private var page = 1
    private var movies: [MovieViewModelRepresentableType] = []
    var reloadData: (() -> ())?
    var errorMessageCallback: ((Error) -> ())?
    
    
    
    //MARK: - Dependencies -
    
    private let movieService: MoviesServiceType
    
    
    
    //MARK: - Init -
    
    init(movieService: MoviesServiceType) {
        self.movieService = movieService
    }
    
    
    
    //MARK: - Methods -
    
    func getMovies() {
        do {
            try self.movieService.getMovies(page: self.page) { [weak self] result in
                switch result {
                case .success(let cinemaDataModel):
                    self?.movies += cinemaDataModel.results!.compactMap { MovieViewModelRepresentable(movie: $0) }
                    self?.reloadData?()
                case .failure(let message):
                    self?.errorMessageCallback?(message)
                }
            }
        } catch {
            self.errorMessageCallback?(error)
        }
    }
    
    func getMoreMovies() {
        self.page += 1
        self.getMovies()
    }
    
    func getMoviesCount() -> Int {
        self.movies.count
    }
    
    func getMovie(by indexPath: IndexPath) -> MovieViewModelRepresentableType {
        self.movies[indexPath.row]
    }
}



