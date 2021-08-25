import UIKit
import AlamofireImage
class CustomCollectionViewCell: UICollectionViewCell {
    static let identifier = "CustomCollectionViewCell"
    
    
    private let myImageView : UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        contentView.backgroundColor = .gray.withAlphaComponent(0.5)
        contentView.clipsToBounds = true
        
        contentView.addSubview(myImageView)
        myImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        myImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        myImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        
    }
    public func configure(imageName: URL){
        print(imageName)
        self.myImageView.af.cancelImageRequest()
        self.myImageView.af.setImage(withURL: imageName, placeholderImage: UIImage(named: "ogurek"))
    }
    
}
