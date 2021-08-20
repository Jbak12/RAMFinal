//
//  CharactrPreViewModel.swift
//  RAMFinal
//
//  Created by admin on 20/08/2021.
//

import Foundation
import UIKit

class CharacterPreviewModel: CharacterPreviewModelType {
    
    var output: CharacterPreviewController!
    
    var character: CDCharacter! {
        didSet {
            self.output.refreshView()
        }
    }
    
    var image: UIImage? {
        let data = character.characterImage!
        if let image = UIImage(data: data){
            return image
        } else {
            return UIImage(named: "ogurek")
        }
    }
    
    var name: String?{
        if let name = character.name {
            return name
        }else{
            return "d"
        }
    }
    
    var gender: String{
        if let gender = character.gender {
            return gender
        } else {
            return "no gender"
        }
    }
    
    var species: String{
        if let species = character.species {
            return species
        } else {
            return "no species"
        }
    }
    
    var episodeCounter: Int {
        return Int(character.episodesCount)
    }
    
    var originLocationName: String{
        if let originLocationName = character.originLocation{
            return originLocationName
        } else {
            return "nkiju"
        }
    }
    
    var status: String {
        if let status = character.status{
            return status
        } else {
            return "no status"
        }
    }
    
    var firstEpisode: String {
        if let firstEpisode = character.firstEpisode {
            return firstEpisode
        } else {
            return "gfdg"
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required init(characterId: Int16) {
        let characters = try! AppDelegate.shared.persistentContainer.viewContext.fetch(CDCharacter.fetchRequest()) as? [CDCharacter]
        if let character = characters?.first(where: { $0.id == characterId }) {
            self.character = character
        }
    }
    


    
    
}
