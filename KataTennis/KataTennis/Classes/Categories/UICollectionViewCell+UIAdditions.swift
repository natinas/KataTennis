import UIKit

var UICollectionViewCell_marginRect : Int = 0

public extension UICollectionViewCell {
    
    // inspectables to allow inserting margin on contentview of cell
    @IBInspectable public var contentViewOriginMargin : CGPoint{
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
            if let margin = (objc_getAssociatedObject(self, &UICollectionViewCell_marginRect) as? NSValue)?.cgRectValue{
                return margin
            }
            return CGRect()
        }
        set{
            objc_setAssociatedObject(self, &UICollectionViewCell_marginRect, NSValue(cgRect:newValue), .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
}
