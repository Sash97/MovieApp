//
//  AppCoordinator.swift
//  MovieApp
//
//  Created by Aleksandr Bagdasaryan on 09.03.22.
//

import UIKit



final class AppCoordinator: Coordinator {
    private var window: UIWindow?
    var childrens: [Coordinator] = []
    var navigationController: ABNavigationController
    
    init(window: UIWindow) {
        self.window = window
        self.navigationController = OtherControllerBuilder.createABNav()
    }
    
    func start() {
        let child = HomeCoordinator(navigationController: self.navigationController)
        child.parentCoordinator = self
        childrens.append(child)
        child.start()
        window?.rootViewController = child.navigationController
        window?.makeKeyAndVisible()
    }
}

