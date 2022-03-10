//
//  HomeController.swift
//  MovieApp
//
//  Created by Aleksandr Bagdasaryan on 09.03.22.
//

import UIKit


class HomeController: UIViewController {
    
    //MARK: - Outlets -
    
    
    
    //MARK: - Properties -
    
    
    
    //MARK: - Dependencies -

    weak var coordinator: HomeCoordinator?
    
    
    
    
    //MARK: - Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    
    //MARK: - Methods -
    
    private func configureNavigationBar() {
        self.navigationItem.title = "Movies"
    }
    
    
    
    //MARK: - Actions -
}
