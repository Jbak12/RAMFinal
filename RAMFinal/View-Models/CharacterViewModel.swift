import UIKit
import Alamofire
import PromiseKit

class CharacterViewModel: CharacterViewViewModelType {   
    weak var output: CharacterViewControllerType?
    
    private var odcinek: Episode? {
        didSet{
            self.output?.reloadView()
        }
    }
    
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
            return 1234
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
    
    var firstEpisode: String{
        if let numerOdcinka = odcinek?.episode{
            return numerOdcinka
        }else{
            return "jezu nie wiem co rovic"
        }
    }
    var firstEpisodeName: String{
        if let odcinkaimie = odcinek?.name{
            return odcinkaimie
        }else{
            return"AAAAAAAA"
        }
    }
    
    
    var dataManager = DataManager()
    
//    private func fetchData() {
//        dataManager.getPage(1, type: Character.self){ page in
//            let randomPageNo = Int.random(in: 1...page.info.pages)
//            self.dataManager.getPage(randomPageNo, type: Character.self) { randomPage in
//                let randomCharacterNo = Int.random(in: 1..<randomPage.results.count)
//                let randomCharacter = randomPage.results[randomCharacterNo]
//                self.ziomal = randomCharacter
//            }
//        }
//    }
//    private func fetchEpisodeName(episodeUrl: String) {
//        dataManager.getEpisode(episodeUrl: episodeUrl) { retEpisode in
//            self.odcinek = retEpisode
//        }
//    }
    //unc fetchzioal
    
    func drawData() {
        self.output?.setLoading(isLoading: true)
        
        firstly {
            dataManager.getPage(1, type: Character.self)
        }.then { firstPage -> Promise<Page<Character>> in
            self.dataManager.getPage(Int.random(in: 1...firstPage.info.pages), type: Character.self)
        }.then { nextRandomPage -> Promise<Episode> in
            let randomCharacterNo = Int.random(in: 1..<nextRandomPage.results.count)
            let randomCharacter = nextRandomPage.results[randomCharacterNo]
            self.ziomal = randomCharacter
            
            return self.dataManager.getEpisode(episodeUrl: self.ziomal!.episode[0])
        }.ensure {
            self.output?.setLoading(isLoading: false)
        }.done { episode in
            self.odcinek = episode
        }.catch { error in
            self.output?.showError(mesasge: error.localizedDescription)
        }
    }
        
        
        
//
//        fetchData()
//        fetchEpisodeName(episodeUrl: self.ziomal?.episode[0] ?? "https://rickandmortyapi.com/api/episode/1")
//    }
}
