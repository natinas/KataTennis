import UIKit

var UICollectionView_cellIdentifierKey : Int = 0
var UICollectionView_headerIdentifierKey : Int = 0
var UICollectionView_footerIdentifierKey : Int = 0

public extension UICollectionView {
    // Property accessible from storyboard for cell to load identifier
    @IBInspectable public var cellIdentifier : String? {
        get {
            return objc_getAssociatedObject(self, &UICollectionView_cellIdentifierKey) as? String
        }
        set {
            objc_setAssociatedObject(self, &UICollectionView_cellIdentifierKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    // Property accessible from storyboard for header to load identifier
    @IBInspectable public var headerIdentifier : String? {
        get {
            return objc_getAssociatedObject(self, &UICollectionView_headerIdentifierKey) as? String
        }
        set {
            objc_setAssociatedObject(self, &UICollectionView_headerIdentifierKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    // Property accessible from storyboard for footer to load identifier
    @IBInspectable public var footerIdentifier : String? {
        get {
            return objc_getAssociatedObject(self, &UICollectionView_footerIdentifierKey) as? String
        }
        set {
            objc_setAssociatedObject(self, &UICollectionView_footerIdentifierKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
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
            }
        }
    }
}

public extension UICollectionView{
    // register celle from xibname and cell identifier provided in above properties
    public func registerCell(){
        guard let identifier = self.cellIdentifier else{
            return
        }
        
        self.register(UINib(nibName: identifier, bundle: Bundle.main),forCellWithReuseIdentifier: identifier)
    }
    // register celle from xibname and cell identifier provided in above properties
    public func registerHeader(){
        guard let identifier = self.headerIdentifier else{
            return
        }
        
        self.register(UINib(nibName: identifier, bundle: Bundle.main), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: identifier)
    }
    // register celle from xibname and cell identifier provided in above properties
    public func registerFooter(){
        guard let identifier = self.footerIdentifier else{
            return
        }
        self.register(UINib(nibName: identifier, bundle: Bundle.main), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: identifier)
    }
    // get cell from index path only (cell identifier in above property)
    public func dequeueReusableCell(forIndexPath indexPath: IndexPath) -> UICollectionViewCell?{
        guard let identifier = self.cellIdentifier else{
            return nil
        }
        return self.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
    }
    // get cell from index path only (header identifier in above property)
    public func dequeueReusableHeader(forIndexPath indexPath: IndexPath) -> UICollectionReusableView?{
        guard let identifier = self.headerIdentifier else{
            return nil
        }
        return self.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: identifier, for: indexPath)
    }
    
    // get cell from index path only (footer identifier in above property)
    public func dequeueReusableFooter(forIndexPath indexPath: IndexPath) -> UICollectionReusableView?{
        guard let identifier = self.footerIdentifier else{
            return nil
        }
        return self.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: identifier, for: indexPath)
    }
}
