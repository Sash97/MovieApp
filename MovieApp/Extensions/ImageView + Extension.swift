//
//  ImageView + Extension.swift
//  MovieApp
//
//  Created by Aleksandr Bagdasaryan on 10.03.22.
//

import UIKit
import SDWebImage
import MBProgressHUD



extension UIImageView {
    func retrieveImage(with string: String?, default image: UIImage? = UIImage(named: ABImages.shimmer)) {
        DispatchQueue.main.async { self.image = image }
        guard let string = string else { return }
        guard let url = URL(string: string) else { print("Wrong url"); return }
        self.startHud(backgroundColor: .clear, text: nil, y: 0)
        self.sd_setImage(with: url) { [weak self] (image, error, cache, url) in
            guard let self = self else { return }
            if let _ = error { self.finishHud(); return }
            guard let image = image else { self.finishHud(); return }
            DispatchQueue.main.async {
                self.image = image
                self.finishHud()
            }
        }
    }
}

