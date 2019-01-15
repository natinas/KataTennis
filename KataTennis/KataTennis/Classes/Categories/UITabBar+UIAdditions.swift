import UIKit

extension UITabBar {
    
    // Used to set the tabBar top border color equals as the tabBar tint color
    @IBInspectable public var hideTabBarTopBorder: Bool {
        set {
            if newValue {
                let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 0.5)
                UIGraphicsBeginImageContext(rect.size)
                
                // Retrieving the context and the color informed
                guard let context = UIGraphicsGetCurrentContext(), let barTintColor = self.barTintColor else {
                    UIGraphicsEndImageContext()
                    return
                }
                
                // Setting the current tabBar tint color
                context.setFillColor(barTintColor.cgColor)
                context.fill(rect)
                // Creating the image
                let image = UIGraphicsGetImageFromCurrentImageContext()
                UIGraphicsEndImageContext()
                
                // Setting the tabBar shadow and background images
                self.backgroundImage = image
                self.shadowImage = image
            } else {
                // If the top border doesn't have to be hidden
                self.backgroundImage = nil
                self.shadowImage = nil
            }
        } get {
            return false
        }
    }
}
