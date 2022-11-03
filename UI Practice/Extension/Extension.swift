//
//  Extension.swift
//  UI Practice
//
//  Created by 陳韋綸 on 2022/11/3.
//

import Foundation
import UIKit


extension UILabel {
    
    func normal(font: UIFont, textColor: UIColor) -> UILabel {
        self.textColor = .black
        self.font = font
        self.textAlignment = .center
        self.numberOfLines = 0
        return self
    }
}

extension UIImageView {
    
    func normal() -> UIImageView {
        self.contentMode = .scaleAspectFill
        self.layer.masksToBounds = true
        return self
    }
}
