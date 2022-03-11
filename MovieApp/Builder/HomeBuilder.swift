//
//  HomeBuilder.swift
//  MovieApp
//
//  Created by Aleksandr Bagdasaryan on 09.03.22.
//

import UIKit


protocol HomeBuilderType {
    static func createHomeVC(with coordinator: HomeCoordinator) -> UIViewController
}


final class HomeBuilder: HomeBuilderType {
    static func createHomeVC(with coordinator: HomeCoordinator) -> UIViewController {
        let homeController = UIStoryboard.main.instantiateViewController(withIdentifier: Controllers.home) as! HomeController
        homeController.coordinator = coordinator
        homeController.movieViewModel = MovieViewModel(movieService: MoviesService.shared)
        return homeController
    }
}
