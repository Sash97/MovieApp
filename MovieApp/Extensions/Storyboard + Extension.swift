//
//  Storyboard + Extension.swift
//  MovieApp
//
//  Created by Aleksandr Bagdasaryan on 09.03.22.
//

import UIKit


extension UIStoryboard {
    @nonobjc class var main: UIStoryboard {
        UIStoryboard(name: Storyboard.main, bundle: nil)
    }
}
