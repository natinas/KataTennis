import UIKit
import ObjectiveC

public extension UILabel {

    //inspectable used to add a text on the label
    @IBInspectable public var textStringKey : String?{
        get{
            return nil
        }
        set{
            self.text = (newValue != nil) ? NSLocalizedString(newValue!, comment: "") : nil
        }
    }
}
