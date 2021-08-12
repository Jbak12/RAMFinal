import Foundation
import UIKit

class CharacterView: UIView {
    
    var onButtonPress: (() -> Void)?
    
    lazy var scrollView = UIScrollView()
    lazy var stackView = UIStackView()
    
    lazy var characterImage = UIImageView()
    
    lazy var characterLabel = UILabel()
    lazy var genderLabel = UILabel()
    
    private lazy var button = UIButton()
    private lazy var AddToCollectionButton = UIButton()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        
        self.backgroundColor = UIColor(red: 46.8/255, green:62.9/255 , blue: 59.3/255, alpha: 1)
        
        self.addSubview(scrollView)
        self.scrollView.delegate = self
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        self.scrollView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor).isActive = true
        self.scrollView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
        self.scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        self.scrollView.addSubview(stackView)
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.axis = .vertical
        self.stackView.spacing = 30.0
        self.stackView.distribution = .equalSpacing
        self.stackView.alignment = .center
        self.stackView.topAnchor.constraint(equalTo: self.scrollView.topAnchor).isActive = true
        self.stackView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor).isActive = true
        self.stackView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor).isActive = true
        self.stackView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor).isActive = true
        self.stackView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        
        self.stackView.addArrangedSubview(self.characterLabel)
        self.characterLabel.translatesAutoresizingMaskIntoConstraints = false
        self.characterLabel.textAlignment = .center
        self.characterLabel.backgroundColor = .basicBackground
        self.characterLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.characterLabel.widthAnchor.constraint(equalTo: self.stackView.widthAnchor, multiplier: 0.7).isActive = true
        self.characterLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        self.characterLabel.font.withSize(40.0)
//        characterLabel.topAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: 30.0).isActive = true
//        characterLabel.text = "dddwsd"
        
        self.stackView.addArrangedSubview(self.characterImage)
        self.characterImage.translatesAutoresizingMaskIntoConstraints = false
        self.characterImage.contentMode = .scaleAspectFill
        self.characterImage.backgroundColor = .clear
        self.characterImage.image = UIImage(named: "ogurek")
        self.characterImage.widthAnchor.constraint(equalTo: self.stackView.widthAnchor, multiplier: 0.7).isActive = true
        self.characterImage.heightAnchor.constraint(equalTo: self.characterImage.widthAnchor).isActive = true
//        characterImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
//        characterImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true


        
        self.stackView.addArrangedSubview(self.genderLabel)
        self.genderLabel.translatesAutoresizingMaskIntoConstraints = false
        self.genderLabel.contentMode = .scaleAspectFit
        self.genderLabel.backgroundColor = .basicBackground
        self.genderLabel.textAlignment = .center
        self.genderLabel.widthAnchor.constraint(equalTo: self.stackView.widthAnchor, multiplier: 0.7).isActive = true
        
        self.stackView.addArrangedSubview(self.button)
        self.button.translatesAutoresizingMaskIntoConstraints = false
        self.button.setTitle("LOSUJ POSTAĆ", for: .normal)
        self.button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        self.button.backgroundColor = .purple
        self.button.layer.cornerRadius = 10
        
       
        self.stackView.addArrangedSubview(self.AddToCollectionButton)
        self.AddToCollectionButton.translatesAutoresizingMaskIntoConstraints = false
        self.AddToCollectionButton.setTitle("Dodaj ziomala do kolekcji", for: .normal)
        self.AddToCollectionButton.backgroundColor = .green
        self.AddToCollectionButton.layer.cornerRadius = 10
        self.AddToCollectionButton.layer.borderWidth = 1
        self.AddToCollectionButton.layer.borderColor = UIColor.black.cgColor
        
        
    }
    
    @objc private func buttonPressed(_ sender: Any) {
        self.onButtonPress?()
    }
}

extension CharacterView: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("Content offset y: \(scrollView.contentOffset.y)")
    }
    
    func setButtonsInput(_ isEnabled: Bool) {
        self.button.isEnabled = isEnabled
    }
    
}
