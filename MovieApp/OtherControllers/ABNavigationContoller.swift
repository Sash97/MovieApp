//
//  ABNavigationContoller.swift
//  MovieApp
//
//  Created by Aleksandr Bagdasaryan on 09.03.22.
//

import UIKit


class ABNavigationController: UINavigationController {
    
    //MARK: - Properties -

    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    
    
    
    //MARK: - Life Cycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureNavigationBar(largeTitleColor: .white,
                                    backgoundColor: .black,
                                    tintColor: .white,
                                    preferredLargeTitle: true)
    }
}


extension UINavigationController {
    func configureNavigationBar(largeTitleColor: UIColor, backgoundColor: UIColor, tintColor: UIColor, preferredLargeTitle: Bool) {
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithTransparentBackground()
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: largeTitleColor]
            navBarAppearance.titleTextAttributes = [.foregroundColor: largeTitleColor, .font: UIFont.systemFont(ofSize: 14)]
            navBarAppearance.backgroundColor = backgoundColor
            
            self.navigationBar.standardAppearance = navBarAppearance
            self.navigationBar.compactAppearance = navBarAppearance
            self.navigationBar.scrollEdgeAppearance = navBarAppearance
            
            self.navigationBar.prefersLargeTitles = preferredLargeTitle
            self.navigationBar.isTranslucent = false
            self.navigationBar.tintColor = tintColor
        } else {
            self.navigationBar.barTintColor = backgoundColor
            self.navigationBar.tintColor = tintColor
            self.navigationBar.isTranslucent = false
        }
    }
}
