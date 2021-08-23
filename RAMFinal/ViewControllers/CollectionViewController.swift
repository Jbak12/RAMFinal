import Foundation
import UIKit

class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    private var collectionView : UICollectionView?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.title = "CollectionView"
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        let layout  = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 11
        
        layout.itemSize = CGSize(width: view.frame.size.width/3 - 10, height: view.frame.size.width/3 - 10)
        
        collectionView = UICollectionView(frame: .zero,collectionViewLayout: layout)
        guard let collectionView = collectionView else {return}
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier )
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        collectionView.backgroundColor = .basicBackground
        collectionView.frame = view.bounds
        
    }
    var counter = 30
 
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return counter
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        print("\(indexPath.row) : \(counter)")
        if indexPath.row >= counter - 3 {
            counter += 20
            collectionView.reloadData()
        }
        
    }
    
}
