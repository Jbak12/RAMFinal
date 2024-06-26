//
//  ViewController.swift
//  RAMFinal
//
//  Created by admin on 06/08/2021.
//

import UIKit
import Alamofire
import AlamofireImage
import MBProgressHUD

class CharacterViewController: UIViewController, CharacterViewControllerType {
    
    var myView : CharacterView!
    var viewModel : CharacterViewModelType!
    
    required init(viewModel: CharacterViewModelType) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
        self.viewModel.output = self
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bindViewWithController() {
        self.myView.onDrawButtonPress = { [weak self] in
            guard let self = self else { return }
            self.viewModel.drawData()
        }
        
        self.myView.onSaveButtonPress = { [weak self] in
            guard let self = self else { return }
            let vc = CharactersTableViewController(viewModel: self.viewModel.tableViewModel)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    func reloadView() {
        self.myView.characterLabel.text = self.viewModel.name
        
        //self.myView.saveButton.isEnabled = false
        if let url = self.viewModel.imageUrl {
            self.myView.characterImage.af.setImage(withURL: url, placeholderImage: UIImage(named: "ogurek"), imageTransition: .crossDissolve(1.0)) { result in
                //self.myView.saveButton.isEnabled = true
                self.myView.drawButton.backgroundColor = .buttonBackground
            }
        }
        self.myView.genderLabel.gender(self.viewModel.gender)
        self.myView.characterLabel.changeFormat()
        self.myView.speciesLabel.species(species: self.viewModel.species)
        self.myView.episodesLabel.episodes(episodes: self.viewModel.episodeCounter)
        self.myView.originLabel.originLocation(locationName: self.viewModel.originLocationName, gender: self.viewModel.gender)
        self.myView.statusLabel.liveStatus(status: self.viewModel.status)
        self.myView.firstEpisodeLabel.FirstAppeared(firstEpisode: self.viewModel.firstEpisode)
       
        let desiredOffset = CGPoint(x: 0, y: -myView.scrollView.contentInset.top)
        self.myView.scrollView.setContentOffset(desiredOffset, animated: true)
        
        //self.characters.append(self.viewModel.)
        //self.myView.button.isEnabled = true
    }
    
    func saveToCoreData() {
        
        self.viewModel.saveData(image: self.myView.characterImage.image)
        
    }
    
    func setLoading(isLoading: Bool) {
        //self.myView.drawButton.isEnabled = !isLoading
        
        if isLoading {
            MBProgressHUD.showAdded(to: self.view, animated: true)
        } else {
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }
    
    func showError(mesasge: String) {
        let alert = UIAlertController(title: nil, message: mesasge, preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    override func loadView() {
        let theView = CharacterView()
        myView = theView
        theView.VCp = self
        self.view = theView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.viewModel.didLoadView()
        self.bindViewWithController()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       // self.myView.setButtonsHidden(true, withAnimation: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if self.viewModel.check() {
            self.disableSaveButton()
        } else{
            self.enableSaveButton()
        }
        if self.viewModel.comesFromCollection == true {
            self.navigationController?.setNavigationBarHidden(false, animated: true)
        } else {
            self.navigationController?.setNavigationBarHidden(true, animated: true)
        }
        
    }
    
    func disableSaveButton() {
        self.myView.saveButton.isEnabled = false
        self.myView.saveButton.backgroundColor = .gray
    }
    func enableSaveButton() {
        self.myView.saveButton.isEnabled = true
        self.myView.saveButton.backgroundColor = .buttonBackground
    }
    func goToCollection() {
        let collectionViewModel = CharactersCollectionViewModel()
        let CVC = CollectionViewController(viewModel: collectionViewModel)
        //self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationController?.pushViewController(CVC, animated: true)
    }
}

extension CharacterViewController: ViewBackend {
    
    func initiateSave() {
        self.saveToCoreData()
    }
    func goToCV() {
        self.goToCollection()
    }
}
