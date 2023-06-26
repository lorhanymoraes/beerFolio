//
//  UIView+Extensions.swift
//  beerFolio
//
//  Created by Lorhany Moraes on 26/06/23.
//

import UIKit.UIView

extension UIView {
    func clearConstraints() {
        for subview in subviews {
            subview.clearConstraints()
        }
        removeConstraints(constraints)
    }
}
