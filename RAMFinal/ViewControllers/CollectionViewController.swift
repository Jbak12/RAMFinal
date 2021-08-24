import Foundation
import UIKit

class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private var collectionView : CollectionView
    
    init(){
        collectionView = CollectionView(frame: UIScreen.main.bounds)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.collectionView.delegate = self
        collectionView.collectionView.dataSource = self
        self.title = "CollectionView"
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
    }
    
    override func loadView() {
        view = self.collectionView
    }
   
    var imageTab = Array(repeating: UIImage(named: "ogurek"), count: 34)
    var imageTab2 = Array(repeating: UIImage(named: "ogurek"), count: 34)
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("AKTUALNIE W COLLECTIONVIEW: \(imageTab.count)")
        return imageTab.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath as IndexPath) as! CustomCollectionViewCell
        cell.configure(label: "Character no. \(indexPath.row)", image: imageTab[indexPath.row]!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        //if lastBiggest == max(indexPath.row, lastBiggest) {
        print("\(indexPath.row) : \(imageTab.count)")
        //guard let cell = cell as? CustomCollectionViewCell else { return }
        //cell.configure(label: "Custom: \(indexPath.row)" , image: imageTab[indexPath.row]!)
        if indexPath.row >= imageTab.count - 6 {
            imageTab += imageTab2
            refreshData()
        }
        //}
    }
    
    func refreshData(){
        self.collectionView.collectionView.reloadData()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = CGFloat(floorf(Float(collectionView.bounds.width / 3 ) - 10))
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 11
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}

