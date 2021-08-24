import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    static let identifier = "CustomCollectionViewCell"
    
    
    private let myImageView : UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        //imageView.image  = UIImage(named: "ogurek")
        imageView.backgroundColor = .blue.withAlphaComponent(0.5)
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let myLabel : UILabel = {
       let myLabel = UILabel()
        //myLabel.lineBreakMode = .byClipping
        myLabel.adjustsFontSizeToFitWidth = true
        myLabel.minimumScaleFactor = 0.2
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        myLabel.backgroundColor = .green.withAlphaComponent(0.4)
        myLabel.text  = "Cokolwiek"
        myLabel.textAlignment = .center
        return myLabel
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
        
        contentView.addSubview(myLabel)
        myLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        myLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        myLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        myLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3).isActive = true
        
        contentView.addSubview(myImageView)
        myImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        myImageView.bottomAnchor.constraint(equalTo: self.myLabel.topAnchor).isActive = true
        myImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        
    }
    
    public func configure(label: String, image: UIImage){
        myLabel.text = label
        myImageView.image = image
    }
    
//     override func prepareForReuse() {
//        myLabel.text = nil
//    }
}
