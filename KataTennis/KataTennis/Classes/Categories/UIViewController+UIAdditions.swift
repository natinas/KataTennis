import UIKit

public extension UIViewController {
    
    //inspectable used to add a title on the view controller
    @IBInspectable public var titleStringKey : String?{
        get{
            return nil
        }
        set{
            self.title = newValue != nil ? NSLocalizedString(newValue!, comment: "") : nil
        }
    }
    
}
