import UIKit


// Declare a global var to produce a unique address as the assoc object handle
var UIView_stringsFileNameKey: UInt8 = 0

// Extension UIAdditions

public extension UITextView {
    
    //inspectable used to add a text on the textview
    @IBInspectable public var textStringKey : String?{
        get{
            return nil
        }
        set{
            self.text = (newValue != nil) ? NSLocalizedString(newValue!, comment: "") : nil
        }
    }
}
