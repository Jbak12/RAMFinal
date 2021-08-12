//
//  CharacterViewModelMock.swift
//  RAMFinal
//
//  Created by admin on 09/08/2021.
//

import Foundation

class CharacterViewModelMock: CharacterViewViewModelType {
    
    var gender: String = "Male"
    
    var output: CharacterViewControllerType?
    
    var name: String?
    
    var imageUrl: URL?
    
    
    func outputIsReadyForData() {
        self.name = "Kuba"
        self.imageUrl = URL(string: "https://rickandmortyapi.com/api/character/avatar/312.jpeg")
        self.output?.reloadView()
    }
}
