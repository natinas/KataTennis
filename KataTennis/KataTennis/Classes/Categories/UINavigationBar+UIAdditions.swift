import UIKit

public extension UINavigationBar{
    
    //inspectable used to add an image on the navigation bar
    @IBInspectable public var backgroundImage : UIImage? {
        get{
            return self.backgroundImage
        }
        set{
            self.setBackgroundImage(newValue, for: .default)
        }
    }
    
}
