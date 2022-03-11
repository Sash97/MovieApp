//
//  AlertService.swift
//  MovieApp
//
//  Created by Aleksandr Bagdasaryan on 10.03.22.
//

import UIKit


class AlertService {
    //MARK: - Properties -
    
    static var shared = AlertService()
    
    
    
    //MARK: - Init -
    
    private init() {}
    
    
    
    //MARK: - Methods -
    
    private func showSingleActionAlert(on viewController: UIViewController, with title: String? = nil, and message: String? = nil, buttonTitle: String? = "OK", completion: @escaping () -> Void) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let repeatAction = UIAlertAction(title: buttonTitle, style: .cancel) { action in
            completion()
        }
        alert.addAction(repeatAction)
        DispatchQueue.main.async { viewController.present(alert, animated: true) }
    }
    
    func showErrorAlert(title: Error, on viewController: UIViewController, completion: @escaping () -> Void) {
        self.showSingleActionAlert(on: viewController,
                                   with: title.localizedDescription,
                                   and: "",
                                   completion: completion)
    }
}
