import UIKit

// カスタムレイアウト
class CustomLayout: UICollectionViewLayout {
    
    var attributesArray = [UICollectionViewLayoutAttributes]() // レイアウト情報
    
    // レイアウト情報を計算
    override func prepare() {
        guard let collectionView = collectionView else { return }
        for item in 0..<collectionView.numberOfItems(inSection: 0) {
            let indexPath = IndexPath(item: item, section: 0)
            // レイアウト情報
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributesArray.append(attributes)
        }
    }
    
    // セルのサイズ
    override var collectionViewContentSize: CGSize {
        guard let collectionView = collectionView else { return CGSize(width: 0, height: 0) }
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
    
    // レイアウトの設定
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let attributes = collectionView?.layoutAttributesForItem(at: indexPath)
        attributes?.size = CGSize(width: 100, height: 100) // セルのサイズ
        return attributes
    }
    
    // 特定の範囲内のセルのレイアウト
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributesArray = [UICollectionViewLayoutAttributes]()
        return attributesArray
    }
}
