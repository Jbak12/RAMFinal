import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    static let identifier = "CustomCollectionViewCell"
    
    private let myImageView : UIImageView = {
       let imageView = UIImageView()
        imageView.image  = UIImage(named: "ogurek")
        imageView.backgroundColor = .blue
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let myLabel : UILabel = {
       let myLabel = UILabel()
        myLabel.backgroundColor = .green
        myLabel.text  = "Cokolwiek"
        myLabel.textAlignment = .center
        return myLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = . systemRed
        contentView.backgroundColor = .basicBackground
        contentView.addSubview(myLabel)
        contentView.addSubview(myImageView)
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        myLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        myLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        myLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        myLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3).isActive = true

        myImageView.translatesAutoresizingMaskIntoConstraints = false
        myImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        myImageView.bottomAnchor.constraint(equalTo: self.myLabel.topAnchor).isActive = true
        myImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        super.layoutSubviews()
    }
    
}
