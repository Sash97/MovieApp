//
//  UIView + HUD.swift
//  MovieApp
//
//  Created by Aleksandr Bagdasaryan on 10.03.22.
//

import UIKit
import MBProgressHUD


extension UIView {
    func startHud(backgroundColor: UIColor? = #colorLiteral(red: 0.2514024675, green: 0.107686244, blue: 0.427895546, alpha: 1), text: String? = "Загружается...", y: CGFloat = MBProgressMaxOffset, backgroundViewColor: UIColor = UIColor.init(white: 0.3, alpha: 0.2) ) {
        let hud = MBProgressHUD.showAdded(to: self, animated: true)
        hud.show(animated: true)
        hud.mode = .indeterminate
        hud.backgroundView.backgroundColor = backgroundViewColor
        hud.offset = CGPoint(x: 0, y: y)
        hud.bezelView.backgroundColor = backgroundColor
        hud.label.text = text
        hud.contentColor = .black
        hud.removeFromSuperViewOnHide = true
    }
    
    func finishHud() {
        MBProgressHUD.hide(for: self, animated: true)
    }
}
