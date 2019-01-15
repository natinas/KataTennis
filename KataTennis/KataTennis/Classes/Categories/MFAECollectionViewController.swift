import UIKit

open class MFAECollectionViewController: UICollectionViewController {

    override open func viewDidLoad() {
        super.viewDidLoad()

        //register differents cell
        self.collectionView?.registerCell()
        self.collectionView?.registerHeader()
        self.collectionView?.registerFooter()
    }

    // MARK: - Table view data source
    
    override open func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(forIndexPath: indexPath) ?? UICollectionViewCell()
    }
    
    override open func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            return collectionView.dequeueReusableHeader(forIndexPath: indexPath) ?? UICollectionReusableView()
        case UICollectionView.elementKindSectionFooter:
            return collectionView.dequeueReusableFooter(forIndexPath: indexPath) ?? UICollectionReusableView()
        default:
            return UICollectionReusableView()
        }
        
    }

}
