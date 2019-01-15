import UIKit

public extension UIButton {
    //inspectable used to add a text on the button
    @IBInspectable public var textStringKey: String? {
        get{
            return nil
        }
        set{
            let key: String? = (newValue != nil) ? NSLocalizedString(newValue!, comment: "") : nil
            self.setTitle(key, for: .normal)
        }
    }
    
    //inspectable used to add an auto shrink on the button
    @IBInspectable public var autoShrink: Bool {
        get{
            return false
        }
        set{
            self.titleLabel?.adjustsFontSizeToFitWidth = newValue
        }
    }
    
    //inspectable used to set the content mode of imageview to aspect fit
    @IBInspectable public var imageAspectFit: Bool {
        get{
            return false
        }
        set{
            if newValue{
                self.imageView?.contentMode = .scaleAspectFit
            } else {
                self.imageView?.contentMode = .scaleToFill
            }
        }
    }
    
    //inspectable used to set the content mode of imageview to aspect fill
    @IBInspectable public var imageAspectFill: Bool {
        get{
            return false
        }
        set{
            if newValue{
                self.imageView?.contentMode = .scaleAspectFill
            } else {
                self.imageView?.contentMode = .scaleToFill
            }
        }
    }
}
