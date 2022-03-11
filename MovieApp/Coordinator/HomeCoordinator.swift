//
//  HomeCoordinator.swift
//  MovieApp
//
//  Created by Aleksandr Bagdasaryan on 09.03.22.
//

import UIKit


final class HomeCoordinator: Coordinator {
    var childrens: [Coordinator] = []
    var navigationController: ABNavigationController
    weak var parentCoordinator: Coordinator?
    
    init(navigationController: ABNavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let homeRegistrationController = HomeBuilder.createHomeVC(with: self)
        self.navigationController.pushViewController(homeRegistrationController, animated: true)
    }
}
