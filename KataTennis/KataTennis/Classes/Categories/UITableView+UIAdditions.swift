import UIKit

var UITableView_cellIdentifierKey : Int = 0
var UITableView_headerIdentifierKey : Int = 0
var UITableView_footerIdentifierKey : Int = 0

public extension UITableView {
    
    // Property accessible from storyboard for cell to load identifier
    @IBInspectable public var cellIdentifier : String? {
        get {
            return objc_getAssociatedObject(self, &UITableView_cellIdentifierKey) as? String
        }
        set {
            objc_setAssociatedObject(self, &UITableView_cellIdentifierKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    // Property accessible from storyboard for header to load identifier
    @IBInspectable public var headerIdentifier : String? {
        get {
            return objc_getAssociatedObject(self, &UITableView_headerIdentifierKey) as? String
        }
        set {
            objc_setAssociatedObject(self, &UITableView_headerIdentifierKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    // Property accessible from storyboard for footer to load identifier
    @IBInspectable public var footerIdentifier : String? {
        get {
            return objc_getAssociatedObject(self, &UITableView_footerIdentifierKey) as? String
        }
        set {
            objc_setAssociatedObject(self, &UITableView_footerIdentifierKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    
    // Property accessible from storyboard for background image
    @IBInspectable public var backgroundImage : UIImage?{
        get{
            return (self.backgroundView as? UIImageView)?.image
        }
        set{
            if let bgImage = newValue{
                let bgView : UIImageView! = UIImageView(image: bgImage)
                self.backgroundView = bgView;
                self.backgroundView?.layer.zPosition -= 1
            }
        }
    }
}

public extension UITableView{
    // register celle from xibname and cell identifier provided in above properties
    public func registerCell(){
        guard let identifier = self.cellIdentifier else{
            return
        }
        
        self.register(UINib(nibName: identifier, bundle: Bundle.main), forCellReuseIdentifier: identifier)
    }
    // register celle from xibname and cell identifier provided in above properties
    public func registerHeader(){
        guard let identifier = self.headerIdentifier else{
            return
        }
        
        self.register(UINib(nibName: identifier, bundle: Bundle.main), forHeaderFooterViewReuseIdentifier: identifier)
    }
    // register celle from xibname and cell identifier provided in above properties
    public func registerFooter(){
        guard let identifier = self.footerIdentifier else{
            return
        }
        self.register(UINib(nibName: identifier, bundle: Bundle.main), forHeaderFooterViewReuseIdentifier: identifier)
    }
    // get cell from index path only (cell identifier in above property)
    public func dequeueReusableCell(forIndexPath indexPath: IndexPath) -> UITableViewCell?{
        guard let identifier = self.cellIdentifier else{
            return nil
        }
        return self.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
    }
    // get cell from index path only (header identifier in above property)
    public func dequeueReusableHeader() -> UITableViewHeaderFooterView?{
        guard let identifier = self.headerIdentifier else{
            return nil
        }
        return self.dequeueReusableHeaderFooterView(withIdentifier: identifier)
    }
    // get cell from index path only (footer identifier in above property)
    public func dequeueReusableFooter() -> UITableViewHeaderFooterView?{
        guard let identifier = self.footerIdentifier else{
            return nil
        }
        return self.dequeueReusableHeaderFooterView(withIdentifier: identifier)
    }
}
