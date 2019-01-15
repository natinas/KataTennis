import UIKit
import ObjectiveC
import Foundation

var UIView_shouldRoundLayerKey: UInt8 = 0

public extension UIView {

    
    //inspectable used to add a rotation on the view
    @IBInspectable public var rotationAngle : CGFloat {
        get{
            return 0
        }
        set{
            self.transform = CGAffineTransform(rotationAngle: CGFloat(newValue))
        }
    }
    
    /// Used to update layer's corner radius from UI builder
    @IBInspectable public var layerCornerRadius : CGFloat {
        get{
            return self.layer.cornerRadius
        }
        set{
            self.layer.cornerRadius = newValue
        }
    }
    /// If yes, corner radius will get half of the value of the smaller size
    @IBInspectable public var shouldRoundLayer : Bool{
        get{
            if let should = objc_getAssociatedObject(self, &UIView_shouldRoundLayerKey) as? NSNumber{
                return should.boolValue
            }
            return false
        }
        set(should){
            if should{
                self.layer.cornerRadius = min(self.layer.bounds.width,self.layer.bounds.height) / 2
            }
            objc_setAssociatedObject(self, &UIView_shouldRoundLayerKey, NSNumber(value:should), .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    /// Used to update layer's borders width from UI builder
    @IBInspectable public var layerBorderWidth : CGFloat {
        get{
            return self.layer.borderWidth
        }
        set{
            self.layer.borderWidth = newValue
        }
    }
    /// Used to update layer's borders color from UI builder
    @IBInspectable public var layerBorderColor : UIColor? {
        get{
            return (self.layer.borderColor != nil) ? UIColor(cgColor: self.layer.borderColor!) : nil
        }
        set{
            self.layer.borderColor = newValue?.cgColor
        }
    }

    /// Used to update layer's shadow offset from UI builder
    @IBInspectable public var layerShadowOffset : CGPoint{
        get{
            return CGPoint(x:self.layer.shadowOffset.width, y:self.layer.shadowOffset.height)
        }
        set{
            self.layer.addShadow(newValue, radius: self.layer.shadowRadius, opacity: self.layer.shadowOpacity)
        }
    }
    /// Used to update layer's shadow radius from UI builder
    @IBInspectable public var layerShadowRadius : CGFloat{
        get{
            return self.layer.shadowRadius
        }
        set{
            self.layer.addShadow(CGPoint(x:self.layer.shadowOffset.width, y:self.layer.shadowOffset.height), radius: newValue, opacity: self.layer.shadowOpacity)
        }
    }
    /// Used to update layer's shadow opacity from UI builder
    @IBInspectable public var layerShadowOpacity : CGFloat{
        get{
            return CGFloat(self.layer.shadowOpacity) * 100.0
        }
        set{
            self.layer.addShadow(CGPoint(x:self.layer.shadowOffset.width, y:self.layer.shadowOffset.height), radius: self.layer.shadowRadius, opacity: Float(newValue)/100.0)
        }
    }
}

public extension UIView{
    // update layer UIAdditions parameters
    // recursive : should call same function for subviews
    @objc public func unvalidateLayer(recursive:Bool = true){
        if shouldRoundLayer{
            // round view
            self.layer.cornerRadius = min(self.layer.bounds.width,self.layer.bounds.height) / 2
        }
        
        if recursive{
            self.subviews.forEach({ (subview) in
                subview.unvalidateLayer(recursive: recursive)
            })
        }
    }
}
