//
//  OtherControllersBuilder.swift
//  MovieApp
//
//  Created by Aleksandr Bagdasaryan on 09.03.22.
//

import UIKit


protocol OtherControllerBuilderType {
    static func createABNav() -> ABNavigationController
}


final class OtherControllerBuilder: OtherControllerBuilderType {
    static func createABNav() -> ABNavigationController {
        let abNavController = UIStoryboard.main.instantiateViewController(withIdentifier: Controllers.navigation) as! ABNavigationController
        return abNavController
    }
}
