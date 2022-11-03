





import UIKit

extension UIView {
    
    func anchor(
        top: NSLayoutYAxisAnchor? = nil,
        bottom: NSLayoutYAxisAnchor? = nil,
        left: NSLayoutXAxisAnchor? = nil,
        right: NSLayoutXAxisAnchor? = nil,
        centerX: NSLayoutXAxisAnchor? = nil,
        centerY: NSLayoutYAxisAnchor? = nil,
        width: CGFloat? = nil,
        height: CGFloat? = nil,
        topPadding: CGFloat = 0,
        bottomPadding: CGFloat = 0,
        leftPadding: CGFloat = 0,
        rightPadding: CGFloat = 0
    ) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let topNS = top {
            self.topAnchor.constraint(equalTo: topNS, constant: topPadding).isActive = true
        }
        
        if let bottomNS = bottom {
            self.bottomAnchor.constraint(equalTo: bottomNS, constant: -bottomPadding).isActive = true
        }
        
        if let leftNS = left {
            self.leftAnchor.constraint(equalTo: leftNS, constant: leftPadding).isActive = true
        }
        
        if let rightNS = right {
            self.rightAnchor.constraint(equalTo: rightNS, constant: -rightPadding).isActive = true
        }
        
        if let centerX = centerX {
            self.centerXAnchor.constraint(equalTo: centerX).isActive = true
        }
        
        if let centerY = centerY {
            self.centerYAnchor.constraint(equalTo: centerY).isActive = true
        }
        
        if let widthNS = width {
            self.widthAnchor.constraint(equalToConstant: widthNS).isActive = true
        }
        
        if let heightNS = height {
            self.heightAnchor.constraint(equalToConstant: heightNS).isActive = true
        }
    }
}
