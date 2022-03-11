//
//  MoviesService.swift
//  MovieApp
//
//  Created by Aleksandr Bagdasaryan on 09.03.22.
//

import Foundation



//https://developers.themoviedb.org/3/movies/get-popular-movies.


//images: https://image.tmdb.org/t/p/original

enum NetworkError: Error {
    case wrongUrl
    case networkError(message: String)
    case dataAbsence
    case decodeError
}

protocol MoviesServiceType: AnyObject {
    func getMovies(page: Int, completion: @escaping (Result<CinemaDataModel, NetworkError>) -> Void) throws
}

final class MoviesService: MoviesServiceType {
    //MARK: - Properties -
    
    static let shared = MoviesService()
    
    
    
    //MARK: - Init -
    
    private init() {}
    
    
    
    //MARK: - API -
    
    func getMovies(page: Int, completion: @escaping (Result<CinemaDataModel, NetworkError>) -> Void) throws {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=d3d29a6cee71e9e67f2981755167a936&language=en-US&page=\(page)") else {
            throw NetworkError.wrongUrl
        }
        
        let session = URLSession(configuration: .default)
        session.dataTask(with: url) { (data, response, error) in
            if let error = error { completion(.failure(NetworkError.networkError(message: error.localizedDescription))) }
            guard let data = data else { completion(.failure(NetworkError.dataAbsence)); return }
            do {
                let newData = try JSONDecoder().decode(CinemaDataModel.self, from: data)
                completion(.success(newData))
            } catch {
                completion(.failure(NetworkError.decodeError))
            }
        }.resume()
    }
}
