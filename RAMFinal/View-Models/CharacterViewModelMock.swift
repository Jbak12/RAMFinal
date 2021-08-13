//
//  CharacterViewModelMock.swift
//  RAMFinal
//
//  Created by admin on 09/08/2021.
//

import Foundation

class CharacterViewModelMock: CharacterViewViewModelType {
    var status: String = "cooo"
    var gender: String = "Male"
    
    var output: CharacterViewControllerType?
    
    var name: String?
    
    var imageUrl: URL?
    
    var species: String = "Alien"
    
    var episodeCounter: Int = 2
    
    var originLocationName = "jkdfhskjkgbf"
    
    func outputIsReadyForData() {
        self.name = "Kuba"
        self.imageUrl = URL(string: "https://rickandmortyapi.com/api/character/avatar/312.jpeg")
        self.output?.reloadView()
    }
}
