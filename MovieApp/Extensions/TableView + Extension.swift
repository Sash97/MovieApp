//
//  TableView + Extension.swift
//  MovieApp
//
//  Created by Aleksandr Bagdasaryan on 09.03.22.
//

import UIKit


extension UITableView {
    func dequeReusableCell<T: UITableViewCell>() -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.cellIdentifier) as? T else {
            fatalError("Error dequeuing cell for identifier \(T.cellIdentifier)")
        }
        
        return cell
    }
}
