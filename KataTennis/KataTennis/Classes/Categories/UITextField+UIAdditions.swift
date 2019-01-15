import UIKit

public extension UITextField {
    
    //inspectable used to add a placeholder on the textfield
    @IBInspectable public var placeHolderStringKey : String?{
        get{
            return nil
        }
        set{
            self.placeholder = (newValue != nil) ? NSLocalizedString(newValue!, comment: "") : nil
        }
    }
}


