//
//  Extensions.swift
//  NBAScores
//
//  Created by Anthony Pham on 1/10/23.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}
