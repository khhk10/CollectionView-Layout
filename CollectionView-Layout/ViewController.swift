import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var photoArray: [String] = []
    private let reuseIdentifier = "Cell"
    var cellSize: CGSize!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 新しいセルを生成するためにクラスを登録する
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.dataSource = self // UICollectionViewDataSource
        collectionView.delegate = self // UICollectionViewDelegate
        
        photoArray.append("dish_1.jpg")
        photoArray.append("dish_2.jpg")
        photoArray.append("dish_3.jpg")
        photoArray.append("dish_4.jpg")
        photoArray.append("dish_5.jpg")
        photoArray.append("dish_6.jpg")
        photoArray.append("fruits.jpg")
        photoArray.append("icecream.jpg")
        
        // レイアウト
        let lineSpace: CGFloat = 5 // 行間の余白
        let itemSpace: CGFloat = lineSpace / 2 // セル間の余白
        let outSpace: CGFloat = lineSpace // 外側の余白
        let cellWidth = (view.frame.size.width - outSpace * 2) / 2 - itemSpace
        cellSize = CGSize(width: cellWidth, height: cellWidth)
        print("cellSize: \(cellSize!)")
        configureLayout(itemSpace, lineSpace, outSpace)
    }
    
    // レイアウト設定
    func configureLayout(_ itemSpace: CGFloat, _ lineSpace: CGFloat, _ outSpace: CGFloat) {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: cellSize.width, height: cellSize.height)
        layout.minimumInteritemSpacing = itemSpace // セル間
        layout.minimumLineSpacing = lineSpace // 行間
        layout.sectionInset = UIEdgeInsets(top: 0, left: outSpace, bottom: 0, right: outSpace) // セクション間の余白
        collectionView.collectionViewLayout = layout
    }
    
    // --------------- UICollectionViewDataSource ---------------
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        // UI描画の処理はメインスレッドでする
        DispatchQueue.main.async {
            let image = UIImage(named: self.photoArray[indexPath.row])
            let imageView = UIImageView(image: image)
            imageView.frame.size = cell.frame.size
            // imageView.layer.cornerRadius = imageView.bounds.size.width * 0.05 // 角丸
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            cell.contentView.addSubview(imageView)
            
            print("出力時 cellSize: \(cell.frame.size)")
            print("出力時 imageView size: \(imageView.frame.size)")
        }
        
        print("cellForItemAt \(indexPath.row)")
        
        return cell
    }
    
    // --------------- UICollectionViewDelegate ---------------
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("セレクト! \(indexPath)")
    }
    
    // --------------- UICollectionViewDelegateFlowLayout ---------------
    
    // セルのサイズ
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let newCellSize: CGSize
        if indexPath.row < 4 {
            newCellSize = cellSize
        } else {
            newCellSize = CGSize(width: cellSize.width / 2, height: cellSize.width / 2)
        }
        return newCellSize
    }
    
    // 行間
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    // セル間
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10 / 2
    }
    
    // セクション間の余白
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }

}

