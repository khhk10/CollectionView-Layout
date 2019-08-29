import UIKit

// カスタムレイアウト
class CustomLayout: UICollectionViewLayout {
    
    // セルのサイズ
    override var collectionViewContentSize: CGSize {
        return CGSize(width: 100, height: 100)
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
