import Foundation
import UIKit

class CharacterView: UIView {
    
    var onButtonPress: (() -> Void)?
    
    lazy var scrollView = UIScrollView()
    lazy var stackView = UIStackView()
    lazy var stackView2 = UIStackView()
    
    var characterImage = UIImageView(){
        didSet{
            print("TEKST TESTOEY BALALALAKAK")
            self.drawButton.isEnabled = true
        }
    }
    
    lazy var characterLabel = UILabel()
    lazy var genderLabel = UILabel()
    lazy var speciesLabel = UILabel()
    lazy var episodesLabel = UILabel()
    lazy var originLabel = UILabel()
    lazy var statusLabel = UILabel()
    
    lazy var drawButton = UIButton()
    private lazy var AddToCollectionButton = UIButton()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        
        self.backgroundColor = UIColor(red: 0.31, green: 0.488, blue: 0.497, alpha: 1)
        
        self.addSubview(scrollView)
        self.scrollView.delegate = self
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        self.scrollView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor).isActive = true
        self.scrollView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
        self.scrollView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.85).isActive = true
//        self.scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: - ).isActive = true
        
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
        self.stackView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor).isActive = true
        
        //labelka od imienia
        self.stackView.addArrangedSubview(self.characterLabel)
        self.characterLabel.translatesAutoresizingMaskIntoConstraints = false
        self.characterLabel.textAlignment = .center
        self.characterLabel.backgroundColor = .basicBackground
        self.characterLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.characterLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        self.characterLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        self.characterLabel.font = self.characterLabel.font.withSize(40.0)
        self.characterLabel.font = UIFont.init(name: "data-latin", size: 25.0)
        self.characterLabel.numberOfLines = 0
//      characterLabel.topAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: 30.0).isActive = true

        
        //obrazek
        self.stackView.addArrangedSubview(self.characterImage)
        self.characterImage.translatesAutoresizingMaskIntoConstraints = false
        self.characterImage.contentMode = .scaleAspectFill
        self.characterImage.backgroundColor = .clear
        self.characterImage.image = UIImage(named: "ogurek")
        self.characterImage.widthAnchor.constraint(equalTo: self.stackView.widthAnchor, multiplier: 0.7).isActive = true
        self.characterImage.heightAnchor.constraint(equalTo: self.characterImage.widthAnchor).isActive = true
//      characterImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
//      characterImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true


        //labelka od plci
        self.stackView.addArrangedSubview(self.genderLabel)
        self.genderLabel.translatesAutoresizingMaskIntoConstraints = false
        self.genderLabel.contentMode = .scaleAspectFit
        self.genderLabel.backgroundColor = .basicBackground
        self.genderLabel.textAlignment = .center
        self.genderLabel.widthAnchor.constraint(equalTo: self.stackView.widthAnchor, multiplier: 0.7).isActive = true
        self.genderLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        // labelka od gatunku
        self.stackView.addArrangedSubview(self.speciesLabel)
        self.speciesLabel.translatesAutoresizingMaskIntoConstraints = false
        self.speciesLabel.contentMode = .scaleAspectFit
        self.speciesLabel.backgroundColor = .basicBackground
        self.speciesLabel.textAlignment = .center
        self.speciesLabel.widthAnchor.constraint(equalTo: self.stackView.widthAnchor, multiplier: 0.7).isActive = true
        self.speciesLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        //jhbdfjdfjdsfjhzbvdjsb vjhlbdhbzdfjhbdjzbdf
        
        //labelka od ilosci odcinkow
        self.stackView.addArrangedSubview(self.episodesLabel)
        self.episodesLabel.translatesAutoresizingMaskIntoConstraints = false
        self.episodesLabel.contentMode = .scaleAspectFit
        self.episodesLabel.backgroundColor = .basicBackground
        self.episodesLabel.textAlignment = .center
        self.episodesLabel.widthAnchor.constraint(equalTo: self.stackView.widthAnchor, multiplier: 0.7).isActive = true
        self.episodesLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        //labelka od miejsca pochodzenia
        self.stackView.addArrangedSubview(self.originLabel)
        self.originLabel.translatesAutoresizingMaskIntoConstraints = false
        self.originLabel.contentMode = .scaleAspectFit
        self.originLabel.backgroundColor = .basicBackground
        self.originLabel.textAlignment = .center
        self.originLabel.widthAnchor.constraint(equalTo: self.stackView.widthAnchor, multiplier: 0.7).isActive = true
        self.originLabel.numberOfLines = 0
        self.originLabel.heightAnchor.constraint(greaterThanOrEqualTo: self.episodesLabel.heightAnchor).isActive = true
       
        //labelka od tego czy ziomal jest zywy czy niezywy
        self.stackView.addArrangedSubview(self.statusLabel)
        self.statusLabel.translatesAutoresizingMaskIntoConstraints = false
        self.statusLabel.contentMode = .scaleAspectFit
        self.statusLabel.backgroundColor = .basicBackground
        self.statusLabel.textAlignment = .center
        self.statusLabel.widthAnchor.constraint(equalTo: self.stackView.widthAnchor, multiplier: 0.7).isActive = true
        self.statusLabel.numberOfLines = 0
        self.statusLabel.heightAnchor.constraint(greaterThanOrEqualTo: self.episodesLabel.heightAnchor).isActive = true
                
        self.addSubview(stackView2)
        self.stackView2.translatesAutoresizingMaskIntoConstraints = false
        self.stackView2.axis = .horizontal
        self.stackView2.spacing = 0
        self.stackView2.distribution = .equalSpacing
        self.stackView2.alignment = .center
        self.stackView2.topAnchor.constraint(equalTo: self.scrollView.bottomAnchor).isActive = true
        self.stackView2.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor).isActive = true
        self.stackView2.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor).isActive = true
        self.stackView2.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.stackView2.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true

        
        //przycisk od losowania ziomali
        self.stackView2.addArrangedSubview(drawButton)
        self.drawButton.translatesAutoresizingMaskIntoConstraints = false
        self.drawButton.setTitle("DRAW", for: .normal)
        self.drawButton.addTarget(self, action: #selector(drawButtonPressed(_:)), for: .touchUpInside)
        self.drawButton.backgroundColor = .buttonBackground
        self.drawButton.layer.cornerRadius = 10
        self.drawButton.setTitle("OFF", for: .disabled)
        //self.drawButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.drawButton.topAnchor.constraint(equalTo: self.stackView2.topAnchor).isActive = true
        self.drawButton.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.drawButton.widthAnchor.constraint(equalTo: self.stackView2.widthAnchor,multiplier: 0.5).isActive = true
        self.drawButton.leadingAnchor.constraint(equalTo: self.stackView2.leadingAnchor).isActive = true
        //self.drawButton.trailingAnchor.constraint(equalTo: self.stackView2.trailingAnchor).isActive = true
        
        //przycisk od zapisywania ziomali
        self.stackView2.addArrangedSubview(AddToCollectionButton)
        self.AddToCollectionButton.translatesAutoresizingMaskIntoConstraints = false
        self.AddToCollectionButton.setTitle("SAVE", for: .normal)
        //self.AddToCollectionButton.addTarget(self, action: #selector(drawButtonPressed(_:)), for: .touchUpInside)
        self.AddToCollectionButton.backgroundColor = .buttonBackground
        self.AddToCollectionButton.layer.cornerRadius = 10
        self.AddToCollectionButton.setTitle("OFF", for: .disabled)
        //self.drawButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.AddToCollectionButton.topAnchor.constraint(equalTo: self.stackView2.topAnchor).isActive = true
        self.AddToCollectionButton.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.AddToCollectionButton.widthAnchor.constraint(equalTo: self.stackView2.widthAnchor,multiplier: 0.5).isActive = true
        self.AddToCollectionButton.leadingAnchor.constraint(equalTo: self.drawButton.trailingAnchor).isActive = true
        self.AddToCollectionButton.trailingAnchor.constraint(equalTo: self.stackView2.trailingAnchor).isActive = true
        

        
       
        
        
        
        
        
//        self.stackView.addArrangedSubview(self.AddToCollectionButton)
//        self.AddToCollectionButton.translatesAutoresizingMaskIntoConstraints = false
//        self.AddToCollectionButton.setTitle("Dodaj ziomala do kolekcji", for: .normal)
//        self.AddToCollectionButton.backgroundColor = .green
//        self.AddToCollectionButton.layer.cornerRadius = 10
//        self.AddToCollectionButton.layer.borderWidth = 1
//        self.AddToCollectionButton.layer.borderColor = UIColor.black.cgColor
        
        
    }
    
    @objc private func drawButtonPressed(_ sender: Any) {
        //self.drawButton.isEnabled = false
        self.onButtonPress?()
        self.drawButton.isEnabled = false
        self.drawButton.backgroundColor = .gray
    }
}

extension CharacterView: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("Content offset y: \(scrollView.contentOffset.y)")
    }
    
//    func setButtonsInput(_ isEnabled: Bool) {
//        self.drawButton.isEnabled = isEnabled
//    }
    
}
