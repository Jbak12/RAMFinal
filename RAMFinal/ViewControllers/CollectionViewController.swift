import Foundation
import UIKit

class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, CharactersCollectionOutputType {

    var viewModel: CharactersCollectionViewModelType

    private var collectionView : CollectionView

    required init(viewModel: CharactersCollectionViewModelType) {
        collectionView = CollectionView(frame: UIScreen.main.bounds)
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.output = self
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func didLoadNextPage() {
        DispatchQueue.main.async {
            self.collectionView.collectionView.reloadData()
        }
    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.viewIsLoaded()
        collectionView.collectionView.delegate = self
        collectionView.collectionView.dataSource = self
        self.title = "CollectionView"
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
    }
    
    override func loadView() {
        view = self.collectionView
    }
   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("AKTUALNIE W COLLECTIONVIEW: \(self.viewModel.numberOfItems)")
        return self.viewModel.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath as IndexPath) as! CustomCollectionViewCell
        if let url = URL(string: "https://rickandmortyapi.com/api/character/avatar/\(indexPath.item + 1).jpeg") {
            cell.configure(imageName: url)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let viewModel = self.viewModel.characterViewModel(atIndex: indexPath.item){
        let vc = CharacterViewController(viewModel: viewModel)
            if let characterView = vc.view as? CharacterView {
                characterView.setButtonsHidden(true)
                vc.reloadView()
            }
            
        self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if !self.viewModel.isBusyFetchingData && indexPath.row >= self.viewModel.numberOfItems - 3 {
            self.viewModel.loadMoreData()
        }
    }
    
    func refreshData(){
        DispatchQueue.main.async {
            self.collectionView.collectionView.reloadData()
        }
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

