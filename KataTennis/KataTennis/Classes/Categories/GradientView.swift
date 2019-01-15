import UIKit

@IBDesignable
open class GradientView: UIView {
    
    // MARK: Inspectable properties ******************************
    
    @IBInspectable public var startColor: UIColor = UIColor.white {
        didSet{
            setupView()
        }
    }
    
    @IBInspectable public var startColorStringKey : String? {
        didSet{
            setupView()
        }
    }
    
    @IBInspectable public var endColor: UIColor = UIColor.black {
        didSet{
            setupView()
        }
    }
    
    @IBInspectable public var endColorStringKey : String?{
        didSet{
            setupView()
        }
    }
    
    @IBInspectable public var isHorizontal: Bool = false {
        didSet{
            setupView()
        }
    }
    
    @IBInspectable public var startOffset : CGFloat = 0{
        didSet{
            setupView()
        }
    }
    @IBInspectable public var endOffset : CGFloat = 0{
        didSet{
            setupView()
        }
    }
    
    override open class var layerClass: AnyClass {
        get{
            return CAGradientLayer.self
        }
    }
    
    
    // MARK: Overrides ******************************************
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    
    
    // MARK: Internal functions *********************************
    
    // Setup the view appearance
    private func setupView(){
        var start = startColor
        var end = endColor

        
        let colors:Array<AnyObject> = [start.cgColor, end.cgColor]
        gradientLayer.colors = colors
        
        if (isHorizontal){
            gradientLayer.startPoint = CGPoint(x: startOffset / 100.0, y: 0)
            gradientLayer.endPoint = CGPoint(x: 1 - endOffset / 100.0, y: 0)
        }else{
            gradientLayer.startPoint = CGPoint(x: 0, y: startOffset / 100.0)
            gradientLayer.endPoint = CGPoint(x: 0, y: 1 - endOffset / 100.0)
        }
        
        self.setNeedsDisplay()
    }
    
    // Helper to return the main layer as CAGradientLayer
    var gradientLayer: CAGradientLayer {
        return layer as! CAGradientLayer
    }
}
