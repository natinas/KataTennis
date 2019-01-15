import UIKit

extension UITabBarItem {
    
    // Allows to use localizable strings to set tabBar item title
    @IBInspectable public var textStringKey: String? {
        set {
            self.title = newValue != nil ? NSLocalizedString(newValue!, comment: "") : nil
        }
        
        get { return nil }
    }
}
