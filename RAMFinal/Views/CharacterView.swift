import Foundation
import UIKit

class CharacterView: UIView {
    
    var VCp : ViewBackend!
    
    var onDrawButtonPress: (() -> Void)?
    var onSaveButtonPress: (() -> Void)?
    //var saveToCoreData: (() -> Void)?
    
    lazy var scrollView = UIScrollView()
    
    lazy var stackView = UIStackView()
    lazy var buttonsStackView = UIStackView()
    
    
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
    lazy var firstEpisodeLabel = UILabel()
    
    lazy var drawButton = UIButton()
    lazy var saveButton = UIButton()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        
        self.backgroundColor = UIColor(red: 0.31, green: 0.488, blue: 0.497, alpha: 1)
        
        //labelka od imienia
        self.addSubview(self.characterLabel)
        self.characterLabel.translatesAutoresizingMaskIntoConstraints = false
        self.characterLabel.textAlignment = .center
        self.characterLabel.backgroundColor = .basicBackground
        self.characterLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        self.characterLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.characterLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        self.characterLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        self.characterLabel.font = self.characterLabel.font.withSize(40.0)
        self.characterLabel.font = UIFont.init(name: "data-latin", size: 25.0)
        self.characterLabel.numberOfLines = 0
        
        self.addSubview(scrollView)
        self.scrollView.delegate = self
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.scrollView.topAnchor.constraint(equalTo: self.characterLabel.bottomAnchor).isActive = true
        self.scrollView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor).isActive = true
        self.scrollView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
//        self.scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: - ).isActive = true
        
        self.scrollView.addSubview(stackView)
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.axis = .vertical
        self.stackView.spacing = 30.0
        self.stackView.distribution = .equalSpacing
        self.stackView.alignment = .center
        self.stackView.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 30.0).isActive = true
        self.stackView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor).isActive = true
        self.stackView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor).isActive = true
        self.stackView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: -30.0).isActive = true
        self.stackView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor).isActive = true
        
//      characterLabel.topAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: 30.0).isActive = true

        
        //obrazek
        self.stackView.addArrangedSubview(self.characterImage)
        self.characterImage.translatesAutoresizingMaskIntoConstraints = false
        self.characterImage.contentMode = .scaleAspectFill
        self.characterImage.backgroundColor = .clear
        self.characterImage.image = UIImage(named: "ogurek")
        self.characterImage.widthAnchor.constraint(equalTo: self.stackView.widthAnchor, multiplier: 0.7).isActive = true
        self.characterImage.heightAnchor.constraint(equalTo: self.characterImage.widthAnchor).isActive = true
        self.characterImage.layer.cornerRadius = 20.0
        self.characterImage.layer.masksToBounds = true
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
        self.genderLabel.layer.cornerRadius = 20.0
        self.genderLabel.layer.masksToBounds = true
        
        // labelka od gatunku
        self.stackView.addArrangedSubview(self.speciesLabel)
        self.speciesLabel.translatesAutoresizingMaskIntoConstraints = false
        self.speciesLabel.contentMode = .scaleAspectFit
        self.speciesLabel.backgroundColor = .basicBackground
        self.speciesLabel.textAlignment = .center
        self.speciesLabel.widthAnchor.constraint(equalTo: self.stackView.widthAnchor, multiplier: 0.7).isActive = true
        self.speciesLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 40.0).isActive = true
        self.speciesLabel.numberOfLines = 0
        self.speciesLabel.layer.cornerRadius = 20.0
        self.speciesLabel.layer.masksToBounds = true
        
        //jhbdfjdfjdsfjhzbvdjsb vjhlbdhbzdfjhbdjzbdf
        
        //labelka od ilosci odcinkow
        self.stackView.addArrangedSubview(self.episodesLabel)
        self.episodesLabel.translatesAutoresizingMaskIntoConstraints = false
        self.episodesLabel.contentMode = .scaleAspectFit
        self.episodesLabel.backgroundColor = .basicBackground
        self.episodesLabel.textAlignment = .center
        self.episodesLabel.widthAnchor.constraint(equalTo: self.stackView.widthAnchor, multiplier: 0.7).isActive = true
        self.episodesLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.episodesLabel.layer.cornerRadius = 20.0
        self.episodesLabel.layer.masksToBounds = true
        
        //labelka od miejsca pochodzenia
        self.stackView.addArrangedSubview(self.originLabel)
        self.originLabel.translatesAutoresizingMaskIntoConstraints = false
        self.originLabel.contentMode = .scaleAspectFit
        self.originLabel.backgroundColor = .basicBackground
        self.originLabel.textAlignment = .center
        self.originLabel.widthAnchor.constraint(equalTo: self.stackView.widthAnchor, multiplier: 0.7).isActive = true
        self.originLabel.numberOfLines = 0
        self.originLabel.heightAnchor.constraint(greaterThanOrEqualTo: self.episodesLabel.heightAnchor).isActive = true
        self.originLabel.layer.cornerRadius = 20.0
        self.originLabel.layer.masksToBounds = true
       
        //labelka od tego czy ziomal jest zywy czy niezywy
        self.stackView.addArrangedSubview(self.statusLabel)
        self.statusLabel.translatesAutoresizingMaskIntoConstraints = false
        self.statusLabel.contentMode = .scaleAspectFit
        self.statusLabel.backgroundColor = .basicBackground
        self.statusLabel.textAlignment = .center
        self.statusLabel.widthAnchor.constraint(equalTo: self.stackView.widthAnchor, multiplier: 0.7).isActive = true
        self.statusLabel.numberOfLines = 0
        self.statusLabel.heightAnchor.constraint(greaterThanOrEqualTo: self.episodesLabel.heightAnchor).isActive = true
        self.statusLabel.layer.cornerRadius = 20.0
        self.statusLabel.layer.masksToBounds = true
        
        //Labelka od pierwszego pojawienia sie
        self.stackView.addArrangedSubview(self.firstEpisodeLabel)
        self.firstEpisodeLabel.translatesAutoresizingMaskIntoConstraints = false
        self.firstEpisodeLabel.contentMode = .scaleAspectFit
        self.firstEpisodeLabel.backgroundColor = .basicBackground
        self.firstEpisodeLabel.textAlignment = .center
        self.firstEpisodeLabel.widthAnchor.constraint(equalTo: self.stackView.widthAnchor, multiplier: 0.7).isActive = true
        self.firstEpisodeLabel.numberOfLines = 0
        self.firstEpisodeLabel.heightAnchor.constraint(greaterThanOrEqualTo: self.episodesLabel.heightAnchor).isActive = true
        self.firstEpisodeLabel.layer.cornerRadius = 20.0
        self.firstEpisodeLabel.layer.masksToBounds = true
        
        self.addSubview(buttonsStackView)
        self.buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        self.buttonsStackView.axis = .horizontal
        self.buttonsStackView.spacing = 0
        self.buttonsStackView.distribution = .fillEqually
        self.buttonsStackView.alignment = .center
        self.buttonsStackView.topAnchor.constraint(equalTo: self.scrollView.bottomAnchor).isActive = true
        self.buttonsStackView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor).isActive = true
        self.buttonsStackView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor).isActive = true
        self.buttonsStackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        self.buttonsStackView.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        self.buttonsStackView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        

        
        //przycisk od losowania ziomali
        self.buttonsStackView.addArrangedSubview(drawButton)
        self.drawButton.translatesAutoresizingMaskIntoConstraints = false
        self.drawButton.setTitle("DRAW", for: .normal)
        self.drawButton.addTarget(self, action: #selector(drawButtonPressed(_:)), for: .touchUpInside)
        self.drawButton.backgroundColor = .buttonBackground
        self.drawButton.layer.cornerRadius = 10
        self.drawButton.setTitle("OFF", for: .disabled)
        

        
//        let tap1 = UITapGestureRecognizer(target: self, action: #selector(saveButtonPressed(_:)))
//        tap1.numberOfTapsRequired = 2
//        self.saveButton.addGestureRecognizer(tap1)
        
        
        //przycisk od zapisywania ziomali
        self.buttonsStackView.addArrangedSubview(saveButton)
        self.saveButton.translatesAutoresizingMaskIntoConstraints = false
        self.saveButton.setTitle("SAVE", for: .normal)
        //self.AddToCollectionButton.addTarget(self, action: #selector(drawButtonPressed(_:)), for: .touchUpInside)
        self.saveButton.backgroundColor = .buttonBackground
        self.saveButton.layer.cornerRadius = 10
        self.saveButton.setTitle("OFF", for: .disabled)
        //self.drawButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.saveButton.addTarget(self, action: #selector(saveToCD), for: .touchUpInside)
        //DOUBLE TAP
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(saveButtonPressed(_:)))
        tap2.numberOfTapsRequired = 2
        self.saveButton.addGestureRecognizer(tap2)
        
        
    }
    
    @objc private func drawButtonPressed(_ sender: Any) {
        //self.drawButton.isEnabled = false
        self.onDrawButtonPress?()
//        self.drawButton.isEnabled = false
        self.drawButton.backgroundColor = .gray
    }
    
    @objc private func wypisz(){
        print("cokolwiek")
    }
    
    @objc private func saveButtonPressed(_ sender: Any) {
        self.onSaveButtonPress?()
    }
    @objc private func saveToCD() {
        self.VCp.initiateSave()
    }
    
//    @objc private func saveToCoreData (_ sender: Any){
//        if let myContext = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
//            let CharacterToSave = CDCharacter(context: myContext)
//            CharacterToSave.name = self.characterLabel.text
//            CharacterToSave.gender = self.genderLabel.text
//            CharacterToSave.species = self.speciesLabel.text
//            CharacterToSave.episodesCount = self.episodesLabel.text
//        }
    
}


extension CharacterView: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print("Content offset y: \(scrollView.contentOffset.y)")
    }
   
}
