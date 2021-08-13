import UIKit

class CharacterViewModel: CharacterViewViewModelType {
    
    weak var output: CharacterViewControllerType?
    
    private var ziomal : Character? {
        didSet {
            self.output?.reloadView()
        }
    }
    
    var name: String?{
        return ziomal?.name
    }

    var imageUrl: URL? {
        if let urlString = ziomal?.image {
            return URL(string: urlString)
        }
        return nil
    }
    
    var gender: String {
        if let gender = ziomal?.gender{
            return gender
        }else{
            return "no gender "
        }
        
    }
    var species: String {
        if let species = ziomal?.species{
            return species
        }else{
            return "no species"
        }
    }
    var episodeCounter: Int{
        if let episodecount = ziomal?.episode.count{
            return episodecount
        }else{
            return 2137
        }
    }
    var originLocationName: String{
        if let originlocation = ziomal?.origin.name{
            return originlocation
        }else{
            return "ebebebe"
        }
    }
    var status : String{
        if let status = ziomal?.status{
            return status.rawValue
        }else{
           return "dfgsgdffsdgd"
        }
    }
    
    var dataManager = DataManager()
    
    private func fetchData() {
        dataManager.getPage(1, type: Character.self){ page in
            let randomPageNo = Int.random(in: 1...page.info.pages)
            self.dataManager.getPage(randomPageNo, type: Character.self) { randomPage in
                let randomCharacterNo = Int.random(in: 1..<randomPage.results.count)
                let randomCharacter = randomPage.results[randomCharacterNo]
                self.ziomal = randomCharacter
            }
        }
    }
    
    func outputIsReadyForData() {
        fetchData()
        self.output?.reloadView()
    }
}
