//
//  UITableViewCell+Extensions.swift
//  beerFolio
//
//  Created by Lorhany Moraes on 26/06/23.
//

import UIKit

extension UITableViewCell {
    static func getReuseIdentifier() -> String {
        return String(describing: self)
    }
}
