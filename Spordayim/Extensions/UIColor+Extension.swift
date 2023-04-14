//
//  UIColor+Extension.swift
//  Spordayim
//
//  Created by Mert Demirtaş on 24.03.2023.
//

import UIKit

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: alpha)
    }
}

public extension UIColor {
    static let navBarColor: UIColor = UIColor(r: 80, g: 170, b: 50, alpha: 1)
    static let appBackgroundColor: UIColor = UIColor(r: 245, g: 245, b: 245, alpha: 1)
    static let spinnerColor: UIColor = .black
    static let mainPageTableViewCellColor: UIColor = .clear
}
