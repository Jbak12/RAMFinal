//
//  CharacterViewModelMock.swift
//  RAMFinal
//
//  Created by admin on 09/08/2021.
//

import UIKit
import Foundation

class CharacterViewModelMock: CharacterViewModelType {
    func saveData(image: UIImage?) {
        
    }
    
    var status: String = "cooo"
    var gender: String = "Male"
    
    var output: CharacterViewControllerType?
    
    var name: String?
    
    var imageUrl: URL?
    
    var species: String = "Alien"
    
    var episodeCounter: Int = 2
    
    var originLocationName = "jkdfhskjkgbf"
    var firstEpisode = "fgsggdf"
    
    func drawData() {
        self.name = "Kuba"
        self.imageUrl = URL(string: "https://rickandmortyapi.com/api/character/avatar/312.jpeg")
        self.output?.reloadView()
    }
}
