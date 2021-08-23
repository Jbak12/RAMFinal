//
//  CharacterPreviewController.swift
//  RAMFinal
//
//  Created by admin on 18/08/2021.
//

import UIKit

class CharacterPreviewController: UIViewController {
    
    var previewView: CharacterView!
    var viewModel : CharacterPreviewModelType!
    
    //init(viewModel)
    
    override func loadView() {
        self.previewView = CharacterView(frame: UIScreen.main.bounds)
        self.view = self.previewView
        self.refreshView()
    }
    
    
    required init( viewModel: CharacterPreviewModelType ) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
        self.viewModel.output = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isTranslucent = false
        self.previewView.setButtonsHidden(true)
    }
    func refreshView() {
        self.previewView.characterImage.image = self.viewModel.image
        self.previewView.genderLabel.gender(self.viewModel.gender)
        self.previewView.characterLabel.text = self.viewModel.name
        self.previewView.characterLabel.changeFormat()
        self.previewView.speciesLabel.species(species: self.viewModel.species)
        self.previewView.episodesLabel.episodes(episodes: self.viewModel.episodeCounter)
        self.previewView.originLabel.originLocation(locationName: self.viewModel.originLocationName, gender: self.viewModel.gender)
        self.previewView.statusLabel.liveStatus(status: self.viewModel.status)
        self.previewView.firstEpisodeLabel.FirstAppeared(firstEpisode: self.viewModel.firstEpisode)
       
        let desiredOffset = CGPoint(x: 0, y: -previewView.scrollView.contentInset.top)
        self.previewView.scrollView.setContentOffset(desiredOffset, animated: true)
    }
    
}
