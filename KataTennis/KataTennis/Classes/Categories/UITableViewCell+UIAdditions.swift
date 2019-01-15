import UIKit

var UITableViewCell_marginRect : Int = 0

public extension UITableViewCell {
    
    // inspectables to allow inserting margin on contentview of cell
    @IBInspectable public  var contentViewOriginMargin : CGPoint{
        get{
            return contentViewMargin.origin
        }
        set{
            self.contentViewMargin = CGRect(origin: newValue, size: contentViewMargin.size)
        }
    }
    @IBInspectable public var contentViewSizeMargin : CGSize{
        get{
            return contentViewMargin.size
        }
        set{
            self.contentViewMargin = CGRect(origin: contentViewMargin.origin, size: newValue)
        }
    }
    @objc public var contentViewMargin : CGRect{
        get{
            if let margin = (objc_getAssociatedObject(self, &UITableViewCell_marginRect) as? NSValue)?.cgRectValue{
                return margin
            }
            return CGRect()
        }
        set{
            objc_setAssociatedObject(self, &UITableViewCell_marginRect, NSValue(cgRect:newValue), .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

}
