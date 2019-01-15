import UIKit

// Extension UIAdditions

public extension CALayer {
    /**
     Add shadow to view's layer
     
     - parameter offset:  Offset of shadow
     - parameter radius:  Radius of shadow
     - parameter opacity: Opacity of shadow
     */
    func addShadow(_ offset : CGPoint! = CGPoint(), radius : CGFloat! = 0.0, opacity : Float! = 1.0){
        
        self.masksToBounds = radius == 0 || offset == CGPoint();
        self.shadowOffset = CGSize(width:offset.x, height:offset.y);
        self.shadowRadius = radius;
        self.shadowOpacity = opacity;
    }
}
