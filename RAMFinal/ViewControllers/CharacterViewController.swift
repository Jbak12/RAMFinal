//
//  ViewController.swift
//  RAMFinal
//
//  Created by admin on 06/08/2021.
//

import UIKit
import Alamofire
import AlamofireImage

class CharacterViewController: UIViewController, CharacterViewControllerType {
    var myView : CharacterView!
    var viewModel : CharacterViewViewModelType
    
    required init(viewModel: CharacterViewViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        self.viewModel.output = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bindViewWithController() {
        self.myView.onButtonPress = { [weak self] in
            self?.viewModel.outputIsReadyForData()
        }
    }
    
    func reloadView() {
        self.myView.characterLabel.text = self.viewModel.name
        if let url = self.viewModel.imageUrl {
            self.myView.characterImage.af.setImage(withURL: url, placeholderImage: UIImage(named: "ogurek"), imageTransition: .crossDissolve(1.0)) { result in
                
            }
        }
        self.myView.genderLabel.gender(self.viewModel.gender)
        self.myView.characterLabel.changeFormat()
        self.myView.speciesLabel.species(species: self.viewModel.species)
        self.myView.episodesLabel.episodes(episodes: self.viewModel.episodeCounter)
        self.myView.originLabel.originLocation(locationName: self.viewModel.originLocationName, gender: self.viewModel.gender)
        self.myView.statusLabel.liveStatus(status: self.viewModel.status)
        //self.myView.button.isEnabled = true
    }
    
    override func loadView() {
        let theView = CharacterView()
        myView = theView
        self.view = theView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.outputIsReadyForData()
        self.bindViewWithController()
    }
    
    
//bnlnknasdfidasnifndiu
    //"cokolwiek tesdffdknjkd"

}

