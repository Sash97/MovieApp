//
//  Coordinator.swift
//  MovieApp
//
//  Created by Aleksandr Bagdasaryan on 09.03.22.
//

import UIKit


protocol Coordinator: AnyObject {
    var childrens: [Coordinator] { get set }
    var navigationController: ABNavigationController { get set }
    
    func start()
}
